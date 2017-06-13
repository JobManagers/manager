// JavaScript Document
$(function(){
       var mydate=new Date();
       $("[input-type='date']").each(function(i,El){
         var picker = new Pikaday(
          {
                field: El,
                firstDay: 1,
                minDate: new Date('1900-01-01'),
                maxDate: new Date(),
                format: 'YYYY-MM-DD',
//              defaultDate:mydate,
                yearRange: [1900,2330]
          });
       });
       $("[input-type='dateAll']").each(function(i,El){
         var picker = new Pikaday(
          {
                field: El,
                firstDay: 1,
                minDate: new Date('1900-01-01'),
                maxDate: new Date('2330-01-01'),
                format: 'YYYY-MM-DD',
                yearRange: [1900,2330]
          });
       });
       $("[input-type='dateAfter']").each(function(i,El){
         var picker = new Pikaday(
          {
                field: El,
                firstDay: 1,
                minDate: new Date(),
                maxDate: new Date('2330-01-01'),
                format: 'YYYY-MM-DD',
                yearRange: [1900,2330]
          });
       });
       $(".date_icon").css("cursor","pointer").click(function(){
         $(this).siblings("[input-type]:text").click();
       })
})
