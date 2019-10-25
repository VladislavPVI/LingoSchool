<#import "parts/common.ftl" as c>


<@c.page>
<div class="container">
    <div class="row">
        <div class="col-sm">
            <div class="card mb-3">
                <h5 class="card-header">${user.fullname}</h5>
                <div class="card-body">
                    <h5 class="card-title">Ваш средний балл: ${avg}</h5>
                    <p class="card-text">

                    <div>Ближайшее занятие: <#if bliz??>${bliz.format('dd.MM.yyyy HH : mm')}<#else>Не найдено</#if></div>

                    </p>


                </div>
                <div class="card-footer">
                    ${teacher}
                </div>
            </div>
            <div class="alert alert-success" role="alert">
                Не забывайте ставить оценку учителю после занятия!
            </div>
            <table class="table">
                <thead>
                <tr>
                    <th>Занятия</th>
                    <th>Оценка</th>
                    <th>Оценка учителю</th>

                </tr>
                </thead>
                <tbody>
<#list lessons as lesson>
<tr>
    <td>${lesson.localDateTime.format('dd.MM.yyyy HH : mm')}</td>
    <td>${lesson.studentMark}</td>
    <td>
        <button class="btn btn-light btn-sm dropdown-toggle type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        Mark
        </button>
        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
            <a class="dropdown-item" href="/student-cab/${lesson.id}/1">1</a>
            <a class="dropdown-item" href="/student-cab/${lesson.id}/2">2</a>
            <a class="dropdown-item" href="/student-cab/${lesson.id}/3">3</a>
            <a class="dropdown-item" href="/student-cab/${lesson.id}/4">4</a>
            <a class="dropdown-item" href="/student-cab/${lesson.id}/5">5</a>
        </div>
        ${lesson.teacherMark}






    </td>

</tr>

<#else>
               Нет занятий
</#list>
                </tbody>
            </table>



        </div>
        <div class="col-sm">
            <div class="alert alert-warning" role="alert">
                Обязательно выполни это задание и обсуди с преподавателем!
            </div><#if tasks??>
        <div class="card mb-3">
            <div class="card-header">
                ${tasks.taskname}

            </div>
            <div class="card-body">

                <div class="d-flex justify-content-between align-items-center">
                    <p class="card-text"> ${tasks.text}</p>
                </div>
                <div>
                    <div class="d-flex justify-content-between align-items-center">

                        <small class="text-muted">Уровень: ${tasks.level} Тип: ${tasks.type}
                            Автор: ${tasks.authorName?ifExists}</small>

                    </div>

                </div>


            </div>
        </div>
        <#else>
Заданий нет
        </#if>
        </div>
    </div>
</div>



</@c.page>