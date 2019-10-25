<div class="card-columns">
    <#list tasks as task>
        <div class="card my-3">
            <div class="card-header">
                <div class="d-flex justify-content-between align-items-center">
                    ${task.taskname}

                    <div class="btn-group">
                        <button class="btn btn-light btn-sm dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Назначить студенту
                        </button>
                        <div class="dropdown-menu">
                        <#list students as student>
                            <a class="dropdown-item" href="/students/${student.id}/tasks/${task.id}">${student.fullname}</a>
                        <#else >
                            Нет студентов
                        </#list>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card-body">

                <div class="d-flex justify-content-between align-items-center">
                    <p class="card-text"> ${task.text}</p>
                </div>
                <div>
                    <div class="d-flex justify-content-between align-items-center">

                        <small class="text-muted">Уровень: ${task.level} Тип: ${task.type}
                            Автор: ${task.authorName?ifExists}</small>
                        <div class="btn-group">
                            <a class="btn btn-default" href="/tasks/${task.id}"><span class="fas fa-cog" aria-hidden="true"></span></a>
                            <a class="btn btn-default" href="/delete/${task.id}"><span class="fas fa-trash" aria-hidden="true"></span></a>

                        </div>

                    </div>

                </div>


            </div>
        </div>
    <#else >
Нет заданий
    </#list>
</div>