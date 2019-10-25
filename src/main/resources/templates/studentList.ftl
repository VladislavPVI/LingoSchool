<#import "parts/common.ftl" as c>


<@c.page>

<table class="table">
    <thead>
    <tr>
        <th>Name</th>
        <th>Teacher</th>
        <th></th>


    </tr>
    </thead>
    <tbody>
        
<#list students as student>
<tr>
    <td>${student.fullname}</td>
    <td><#if student.teacherID??><i class="fas fa-check"></i><#else><i class="fas fa-times"></i></#if></td>
    <td><a href="/student/${student.id}"><i class="fas fa-cog"></i></a></td>
</tr>
</#list>
    </tbody>
</table>
</@c.page>