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
            </div>
            <div class="alert alert-primary mt-3" role="alert">
                Всегда помните, что студенты тоже ставят Вам оценку за занятие! Оценка влияет на Вашу зарплату!
            </div>
        </div>
        <div class="col-sm">
            <div class="alert alert-success" role="alert">
                Не забывайте назначать <a href="/main" class="alert-link">новое задание</a> и ставить оценку после занятия!
            </div>
            <table class="table">
                <thead>
                <tr>
                    <th>ФИО студента</th>
                    <th>Задание</th>
                    <th>Занятия</th>


                </tr>
                </thead>
                <tbody>
<#list students as student>
<tr>
    <td>${student.fullname}</td>
    <td><#if student.task??><i class="fas fa-check"></i><#else><i class="fas fa-times"></i></#if></td>
    <td>
           <#list lessons as lesson>
               <#if lesson.student==student>
               <div>
                   ${lesson.localDateTime.format('dd.MM.yyyy HH : mm')}
                   <button class="btn btn-light btn-sm dropdown-toggle type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                   Mark
                   </button>
                   <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                       <a class="dropdown-item" href="/teacherCab/lesson/${lesson.id}/1">1</a>
                       <a class="dropdown-item" href="/teacherCab/lesson/${lesson.id}/2">2</a>
                       <a class="dropdown-item" href="/teacherCab/lesson/${lesson.id}/3">3</a>
                       <a class="dropdown-item" href="/teacherCab/lesson/${lesson.id}/4">4</a>
                       <a class="dropdown-item" href="/teacherCab/lesson/${lesson.id}/5">5</a>
                   </div>
                   ${lesson.studentMark}
                   <a class="btn btn-default" href="/teacherCab/delete/${lesson.id}"><span class="fas fa-trash" aria-hidden="true"></span></a>


               </div>



               </#if>
           <#else>
               Нет занятий
           </#list>
    </td>

</tr>
</#list>
                </tbody>
            </table>

            <a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
                Добавить занятие
            </a>
            <div class="collapse" id="collapseExample">
                <div class="form-group mt-3">
                    <form method="post">
                        <div class="form-group">

                            <select class="form-control" name="currentStudent">
                            <#list students as student>
                                <OPTION value="${student.id}">${student.fullname}</OPTION>
                            </#list>
                            </select>



                        </div>

                        <div class="form-group">
                            <input type="datetime-local" class="form-control" name="timeoflesson" min=${now}>

                        </div>

                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>

                        <div class="form-group">
                            <button type="submit" class="btn btn-primary float-right">Сохранить</button>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

</@c.page>
