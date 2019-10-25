<#import "parts/common.ftl" as c>


<@c.page>

    <div class="container">
        <div class="row">
            <div class="col-sm">
                <div class="card">
                    <h5 class="card-header">${user.fullname}</h5>
                    <div class="card-body">
                        <h5 class="card-title">${user.birthd}</h5>

                        <p class="card-text">

                        <div>Level: ${user.level}</div>
                        Preferences: ${user.preferences?ifExists}

                        </p>

                    </div>
                    <div class="card-footer">
                        <small class="text-muted">${current}</small>
                    </div>
                </div>
                <form action="/student/${user.id}" method="get" class="form-inline mt-3">
                    <select class="form-control" name="filter">
                        <OPTION value="0">Выберите уровень</OPTION>
                        <OPTION value="1">Elementary</OPTION>
                        <OPTION value="2">Pre-Intermediate</OPTION>
                        <OPTION value="3">Intermediate</OPTION>
                        <OPTION value="4">Upper-Intermediate</OPTION>
                        <OPTION value="5">Advanced</OPTION>
                        <OPTION value="6">Proficiency</OPTION>
                    </select>
                    <button type="submit" class="btn btn-light">Найти</button>
                </form>
            </div>

            <div class="col-sm">

             <#list teachers as teacher>
                 <div class="card mb-3">
                     <h5 class="card-header">${teacher.fullname}</h5>
                     <div class="card-body">
                         <h5 class="card-title">${teacher.birthd}</h5>
                         <p class="card-text">

                         <div>Level: ${teacher.level}</div>
                         Preferences: ${teacher.preferences?ifExists}


                         <a href="/student/${user.id}/${teacher.id}" class="btn btn-primary float-right">Назначить</a>


                         </p>


                     </div>
                 </div>
             <#else >
                            Нет учителей
             </#list>
            </div>


        </div>
    </div>

</@c.page>