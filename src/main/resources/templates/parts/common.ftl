<#macro page>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Engschool</title>

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
    <link href="/static/sticky-footer.css" rel="stylesheet">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="/static/vendor/bootstrap/css/bootstrap.min.css">


</head>
<body>
    <#include "navbar.ftl" >
<div class="container mt-5">
<#nested >
</div>

<footer class="footer">
    <div class="container text-center">
        <span class="text-muted">PVI © 2018</span>
    </div>
</footer>
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="/static/vendor/jquery/jquery-3.2.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="/static/vendor/bootstrap/js/bootstrap.min.js"></script>

</body>
</html>
</#macro>