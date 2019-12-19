<#include "security.ftl">


<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" >LingoSchool</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="/">Home</a>
            </li>

            <#if isStudent>
            <li class="nav-item">
                <a class="nav-link" href="/student-cab">Private office</a>
            </li>
             <li class="nav-item">
                 <a class="nav-link" href="/reviews/viewXSLT">Reviews</a>
             </li>
            </#if>
               <#if isTeacher>
            <li class="nav-item">
                <a class="nav-link" href="/teacherCab">Private office</a>
            </li>
                <li class="nav-item">
                    <a class="nav-link" href="/main">Tasks</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/reviews/viewXSLT">Reviews</a>
                </li>
               </#if>
             <#if isEditor>
            <li class="nav-item">
                <a class="nav-link" href="/student">Student list</a>
            </li>
                <li class="nav-item">
                    <a class="nav-link" href="/main">Tasks</a>
                </li>
              <li class="nav-item">
                  <a class="nav-link" href="/reviews/viewXSLT">Reviews</a>
              </li>
             </#if>

            <#if isAdmin>
             <li class="nav-item">
                 <a class="nav-link" href="/main">Tasks</a>
             </li>
            <li class="nav-item">
                <a class="nav-link" href="/user">User list</a>
            </li>
             <li class="nav-item">
                 <a class="nav-link" href="/user/registration">Add user</a>
             </li>
             <li class="nav-item">
                 <a class="nav-link" href="/reviews/viewXSLT">Reviews</a>
             </li>
            </#if>
        </ul>
        <div class="navbar-text mr-3">${name}</div>
        <form action="/logout" method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <button class="btn btn-outline-secondary" type="submit">Выйти</button>
        </form>
    </div>
</nav>