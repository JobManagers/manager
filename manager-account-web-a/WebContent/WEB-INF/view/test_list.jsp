<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<body>
<h2>Hello World!</h2>
<c:forEach items="${list }" var ='i'>
	${i}<br>
</c:forEach>
</body>
</html>
