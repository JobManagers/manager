function showNowGps(x,y){
   	var myIcon = new BMap.Icon("../img/baidu_marker_02.png", new BMap.Size(22,30));
   	
   	var pointA = new BMap.Point(x,y);  // 创建点坐标A--大渡口区
   	var marker1 = new BMap.Marker(pointA,{icon:myIcon});  // 创建标注
   	marker1.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
	map.addOverlay(marker1);              // 将标注添加到地图中
}
//显示弹框
function showPop(obj,className){
	$(".zhy_zhezhao_pop").show();
	var top = document.body.scrollTop||document.documentElement.scrollTop;
	var this_h = $("." + className).height();
	var win_h = ($('html',parent.document).height()-this_h-100)/2
	// console.log("top="+top+";win_h="+win_h);
	$(".zhy_zhezhao_pop").height($("html").height());
	var this_h = $("." + className).height();
	top= top +win_h;
	$("." + className).css("top", top).show();
}
// 隐藏修改弹框
function hidePop(url) {
	$(".zhy_zhezhao_pop").hide();
	$(".zhy_popa").hide();
}
var map = new BMap.Map("allmap");
var geoc = new BMap.Geocoder();
var point;
var Longitude = $("#longitude").val();
var Latitude = $("#latitude").val();

if (Longitude == "" || Longitude == null) {
    var City = "北京市";
    map.centerAndZoom(City, 12);
} else {
    point = new BMap.Point(Longitude,Latitude);//, 
    map.centerAndZoom(point, 17);
    map.clearOverlays();
    var marker = new BMap.Marker(point);  // 创建标注
    map.addOverlay(marker);              // 将标注添加到地图中
    map.panTo(point);
}

//创建缩放控件
map.addControl(new BMap.NavigationControl());
map.enableScrollWheelZoom();    //启用滚轮放大缩小，默认禁用
map.enableContinuousZoom();    //启用地图惯性拖拽，默认禁用


var overlays = [];
//回调获得覆盖物信息
var overlaycomplete = function (e) {
    overlays.push(e.overlay);
    if (e.drawingMode == BMAP_DRAWING_CIRCLE) {
        $("#CircleRadii").val(e.overlay.getRadius());
        $("#CircleOriginX").val(e.overlay.getCenter().lng);
        $("#CircleOriginY").val(e.overlay.getCenter().lat);
    }
    drawingManager.close();
};

var styleOptions = {
    strokeColor: "red",    //边线颜色。
    fillColor: "red",      //填充颜色。当参数为空时，圆形将没有填充效果。
    strokeWeight: 3,       //边线的宽度，以像素为单位。
    strokeOpacity: 0.8,	   //边线透明度，取值范围0 - 1。
    fillOpacity: 0.6,      //填充的透明度，取值范围0 - 1。
    strokeStyle: 'solid' //边线的样式，solid或dashed。
}

//实例化鼠标绘制工具
var drawingManager = new BMapLib.DrawingManager(map, {
    isOpen: false, //是否开启绘制模式
    enableDrawingTool: false, //是否显示工具栏
    drawingToolOptions: {
        anchor: BMAP_ANCHOR_TOP_RIGHT, //位置
        offset: new BMap.Size(5, 5), //偏离值
        scale: 0.8 //工具栏缩放比例
    },
    circleOptions: styleOptions, //圆的样式
    polylineOptions: styleOptions, //线的样式
    polygonOptions: styleOptions, //多边形的样式
    rectangleOptions: styleOptions //矩形的样式
});

drawingManager.addEventListener('overlaycomplete', overlaycomplete);
drawingManager.setDrawingMode(BMAP_DRAWING_CIRCLE);

var zoomIndex = 0;
// 定义一个控件类,即function
function ZoomControl() {
    // 默认停靠位置和偏移量
    this.defaultAnchor = BMAP_ANCHOR_TOP_RIGHT;
    this.defaultOffset = new BMap.Size(10, 10);
}

// 通过JavaScript的prototype属性继承于BMap.Control
ZoomControl.prototype = new BMap.Control();

// 自定义控件必须实现自己的initialize方法,并且将控件的DOM元素返回
// 在本方法中创建个div元素作为控件的容器,并将其添加到地图容器中
ZoomControl.prototype.initialize = function (map) {
    // 创建一个DOM元素
    var div = document.createElement("div");
    // 添加文字说明
    div.appendChild(document.createTextNode("绘制电子围栏"));
    // 设置样式
    div.style.cursor = "pointer";
    div.style.border = "1px solid gray";
    div.style.backgroundColor = "white";
    // 绘圆
    
    div.onclick = function (e) {
        zoomIndex=1;
        if (zoomIndex == 1) {
            map.clearOverlays();
            drawingManager.open();
        }
    };

    // 添加DOM元素到地图中
    map.getContainer().appendChild(div);
    // 将DOM元素返回
    return div;
}
// 创建控件
var myZoomCtrl = new ZoomControl();
// 添加到地图当中
map.addControl(myZoomCtrl);

//保存电子围栏
function SafeRange() {
	var UrlSave = $("#path").val();
    var radii = $("#CircleRadii").val();
    var lng = $("#CircleOriginX").val();
    var lat = $("#CircleOriginY").val();
    var customerId = $("#customerId").val();
    
    if (radii != "") {
        var url = UrlSave+"/customer/save_customerMap";
        $.ajax({
            type: "POST",
            url: url,
            data:{	
         	   "radii":radii,
         	   "longitude":lng,
         	   "latitude":lat,
         	   "customerId":customerId
             },
            success: function (data) {
                if (data && data.isSucceed) {
                    $.sk.success("保存成功");
                    return;
                }
                $.sk.confirm("系统中该客户已经存在电子围栏,您确定替换吗?", function (result) {
                    if (result) {
                    	UpdateRange(); 
                    }
                });
            }
        }, "json");
    } else {
        $.sk.alert("请先绘制电子围栏");
    }
}

//修改电子围栏
function UpdateRange() {
	var UrlSave = $("#path").val();
    var radii = $("#CircleRadii").val();
    var lng = $("#CircleOriginX").val();
    var lat = $("#CircleOriginY").val();
    var customerId = $("#customerId").val();
    if (radii != "") {
        var url = UrlSave+"/customer/update_customerMap";
        $.ajax({
            type: "POST",
            url: url,
            data:{	
         	   "radii":radii,
         	   "longitude":lng,
         	   "latitude":lat,
         	   "customerId":customerId
             },
            success: function (data) {
                if (data && data.isSucceed) {
                    $.sk.success("保存成功");
                    return;
                }
                $.sk.error(data.message);
            }
        }, "json");
    } else {
        $.sk.alert("请先绘制电子围栏");
    }
}
//定位一个点
//function loc(lon, lat, altitude, velocity) {
function loc(lon,lat) {
    $("#range").css("display", "block");
    $("#removerange").css("display", "none");
    map.clearOverlays();
    //StopSetTime();
    var point = new BMap.Point(lon, lat);

    //创建信息窗口

    geoc.getLocation(point, function (rs) {
        var addComp = rs.addressComponents;
        var mess = addComp.district + addComp.street + addComp.streetNumber;
        var infoWindow = new BMap.InfoWindow(mess, { enableMessage: false });
        var marker = new BMap.Marker(point);
        marker.addEventListener("mouseover", function () { this.openInfoWindow(infoWindow); });
        marker.addEventListener("mouseout", function () { this.closeInfoWindow(infoWindow); });
        map.addOverlay(marker);
    });

    map.centerAndZoom(point, 23);
}

var t;
function OpenSetTime() {
    $("#range").css("display", "block");
    $("#removerange").css("display", "none");
    TimeOutFun();
}
function StopSetTime() {
    $("#StopSet").css("display", "none");
    $("#OpenSet").css("display", "block");
}

var locations = null;
var win = null;
//行动轨迹
function TimeOutFun() {
    var url = "/LocaltionDetection/Timeout";
    $.ajax({
        type: "POST",
        url: url,
        data: "",
        success: function (data) {
            if (data.length > 0) {
                locations = data;
                var point = new BMap.Point(data[data.length - 1].Longitude, data[data.length - 1].Latitude);
                //var point = new BMap.Point(116.404, 39.915);
                map.centerAndZoom(point, data.length);
                map.clearOverlays();
                var aa = new Array();
                for (var i = 0; i < data.length; i++) {
                    var po = new BMap.Point(data[i].Longitude, data[i].Latitude);
                    var marker = new BMap.Marker(po);
                    marker.index = i;
                    marker.addEventListener("mouseover", function () {
                        var p = new BMap.Point(locations[this.index].Longitude, locations[this.index].Latitude);
                        var mess = "时间:" + locations[this.index].DetectionTime + " ";
                        var thismarker = this;
                        geoc.getLocation(p, function (rs) {
                            var addComp = rs.addressComponents;
                            mess += addComp.district + addComp.street + addComp.streetNumber;

                            win = new BMap.InfoWindow(mess, { enableMessage: false });
                            thismarker.openInfoWindow(win);
                        });
                    });
                    marker.addEventListener("mouseout", function () {
                        this.closeInfoWindow(win);
                    });
                    if ((i == 0) || (i + 1 == data.length)) {
                        map.addOverlay(marker);
                    }
                    aa.push(po);
                }
                var polyline = new BMap.Polyline(aa, { strokeColor: "blue", strokeWeight: 3, strokeOpacity: 0.5 });
                map.addOverlay(polyline);

                for (var o = aa.length - 2; o > 0; o--) {
                    var angle = getAngle(aa[o], aa[o - 1]);
                    drawMarker(aa[o], angle, o);
                }

            } else if (City == "") {
                var point = new BMap.Point(116.306408, 40.051416);
                map.centerAndZoom(point, 17);
            }
            else {
                map.centerAndZoom(City, 12);
            }
        }
    });

}

//return: -PI to PI  
function getAngle(pt1, pt2) {
    return Math.atan2(pt2.lat - pt1.lat, pt2.lng - pt1.lng);
}


function drawMarker(point, angle, index) {
    var iconImg = createIcon(angle);
    var marker = new BMap.Marker(point, {
        icon: iconImg
    });
    var i = index++;
    marker.addEventListener("mouseover", function () {
        var p = new BMap.Point(locations[i].Longitude, locations[i].Latitude);
        var mess = "时间:" + locations[i].DetectionTime + " ";
        var thismarker = this;
        geoc.getLocation(p, function (rs) {
            var addComp = rs.addressComponents;
            mess += addComp.district + addComp.street + addComp.streetNumber;

            win = new BMap.InfoWindow(mess, { enableMessage: false });
            thismarker.openInfoWindow(win);
        });
    });
    marker.addEventListener("mouseout", function () {
        this.closeInfoWindow(win);
    });

    map.addOverlay(marker);
}

//创建带方向的行动轨迹
function createIcon(angle) {
    //从负Y轴方向开始顺时针查找角度  
    var adjAngles = [180, 202, 225, 247, 270, 292, 315, 337, 0, 22, 45, 67, 90, 112, 135, 157];
    adjAngle = angle;

    var adjIndex = 0;
    for (var i = 0; i < 16; i++) {
        if (adjAngle < (-15 / 16 + i / 8) * Math.PI) {
            adjIndex = i;
            break;
        }
    }

    icon = new BMap.Icon("../Content/directionalPolyline/arrow_" + adjAngles[adjIndex] + ".png", new BMap.Size(22, 22));
    return icon;
}
function addArrow(polyline, length, angleValue) { //绘制箭头的函数  
    var linePoint = polyline.getPath();//线的坐标串  
    var arrowCount = linePoint.length;
    for (var i = 1; i < arrowCount; i++) { //在拐点处绘制箭头  
        var pixelStart = map.pointToPixel(linePoint[i - 1]);
        var pixelEnd = map.pointToPixel(linePoint[i]);
        var angle = angleValue;//箭头和主线的夹角  
        var r = length; // r/Math.sin(angle)代表箭头长度  
        var delta = 0; //主线斜率，垂直时无斜率  
        var param = 0; //代码简洁考虑  
        var pixelTemX, pixelTemY;//临时点坐标  
        var pixelX, pixelY, pixelX1, pixelY1;//箭头两个点  
        if (pixelEnd.x - pixelStart.x == 0) { //斜率不存在是时  
            pixelTemX = pixelEnd.x;
            if (pixelEnd.y > pixelStart.y) {
                pixelTemY = pixelEnd.y - r;
            }
            else {
                pixelTemY = pixelEnd.y + r;
            }
            //已知直角三角形两个点坐标及其中一个角，求另外一个点坐标算法  
            pixelX = pixelTemX - r * Math.tan(angle);
            pixelX1 = pixelTemX + r * Math.tan(angle);
            pixelY = pixelY1 = pixelTemY;
        }
        else  //斜率存在时  
        {
            delta = (pixelEnd.y - pixelStart.y) / (pixelEnd.x - pixelStart.x);
            param = Math.sqrt(delta * delta + 1);

            if ((pixelEnd.x - pixelStart.x) < 0) //第二、三象限  
            {
                pixelTemX = pixelEnd.x + r / param;
                pixelTemY = pixelEnd.y + delta * r / param;
            }
            else//第一、四象限  
            {
                pixelTemX = pixelEnd.x - r / param;
                pixelTemY = pixelEnd.y - delta * r / param;
            }
            //已知直角三角形两个点坐标及其中一个角，求另外一个点坐标算法  
            pixelX = pixelTemX + Math.tan(angle) * r * delta / param;
            pixelY = pixelTemY - Math.tan(angle) * r / param;

            pixelX1 = pixelTemX - Math.tan(angle) * r * delta / param;
            pixelY1 = pixelTemY + Math.tan(angle) * r / param;
        }

        var pointArrow = map.pixelToPoint(new BMap.Pixel(pixelX, pixelY));
        var pointArrow1 = map.pixelToPoint(new BMap.Pixel(pixelX1, pixelY1));
        var Arrow = new BMap.Polyline([
            pointArrow,
         linePoint[i],
            pointArrow1
        ], { strokeColor: "blue", strokeWeight: 3, strokeOpacity: 0.5 });
        map.addOverlay(Arrow);
    }
}

//电子围栏样式和隐藏
var circle;
function Range() {
    $("#range").css("display", "none");
    $("#removerange").css("display", "block");
    if (RadiiViewBag != "" && LngViewBag != "" && LatViewBag != "") {
        var pot = new BMap.Point(LngViewBag, LatViewBag);
        circle = new BMap.Circle(pot, RadiiViewBag);

        circle.setStrokeColor("red");    //边线颜色。
        circle.setFillColor("red");      //填充颜色。当参数为空时，圆形将没有填充效果。
        circle.setStrokeWeight(3);     //边线的宽度，以像素为单位。
        circle.setStrokeOpacity(0.8);	   //边线透明度，取值范围0 - 1。
        circle.setFillOpacity(0.6);      //填充的透明度，取值范围0 - 1。
        circle.setStrokeStyle('solid');//边线的样式，solid或dashed。
        map.addOverlay(circle);
    }
}
function RemoveRange() {
    $("#range").css("display", "block");
    $("#removerange").css("display", "none");
    map.removeOverlay(circle);
}
