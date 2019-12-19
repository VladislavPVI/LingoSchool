<html>
<%@ page contentType="text/html;charset=utf-8" %>
<script src="http://code.jquery.com/jquery-1.10.2.min.js" type="text/javascript" ></script>

<body>
<button id="btn">magic</button>
${some}
<div id="hobby"></div>
</body>
<script type="text/javascript">

    var btn = document.getElementById("btn");
    var hobbyContainer = document.getElementById("hobby");
    btn.addEventListener("click",function(){
        var ourRequest = new XMLHttpRequest();
        ourRequest.open('GET','/ajaxtest');
        ourRequest.onload = function () {
            var ourData = JSON.parse(ourRequest.responseText);
            render(ourData);
            //console.log(ourData[0]);
        };
        ourRequest.send();
    });

    function render(data) {
        var htmlString = "";
        for (i=0;i<data.length;i++){
            htmlString += "<p>" + "Название: " + data[i].name + " Часы в неделю: " +  data[i].hoursperweek + " Приоритет: " + data[i].priority + ".</p>";
        }
        hobbyContainer.innerHTML = htmlString;

    }

</script>
</html>