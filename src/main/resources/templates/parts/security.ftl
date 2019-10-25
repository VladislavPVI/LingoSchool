<#assign
known = Session.SPRING_SECURITY_CONTEXT??
>

<#if known>
    <#assign
    user = Session.SPRING_SECURITY_CONTEXT.authentication.principal
    name = user.getFullname()
    isAdmin = user.isadmin()
    isTeacher = user.isteacher()
    isStudent = user.isstudent()
    isEditor = user.iseditor()
    >

<#else>
    <#assign
    name = "unknown"
    isAdmin = false
    >
</#if>