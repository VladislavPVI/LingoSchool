<a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
    Добавить задание
</a>
    <div class="collapse <#if task??>show</#if>" id="collapseExample">
        <div class="form-group mt-3">
            <form method="post">
                <div class="form-group">
                    <input type="text" class="form-control ${(textError??)?string('is-invalid', '')}"
                           value="<#if task??>${task.taskname}</#if>" name="taskname" placeholder="Название">
                    <#if tasknameError??>
                    <div class="invalid-feedback">
                        ${tasknameError}
                    </div>
                    </#if>
                </div>
                <div class="form-group">
                    <textarea class="form-control ${(textError??)?string('is-invalid', '')}" rows="5" name="text" placeholder="Введите задание"><#if task??>${task.text}</#if></textarea>
                    <#if textError??>
                    <div class="invalid-feedback">
                        ${textError}
                    </div>
                    </#if>

                </div>
                <div class="form-group">
                    <select class="form-control" name="level">
                        <OPTION value="1">Elementary</OPTION>
                        <OPTION value="2">Pre-Intermediate</OPTION>
                        <OPTION value="3">Intermediate</OPTION>
                        <OPTION value="4">Upper-Intermediate</OPTION>
                        <OPTION value="5">Advanced</OPTION>
                        <OPTION value="6">Proficiency</OPTION>
                    </select>
                </div>
                <div class="form-group">
                    <select class="form-control" name="type">
                        <OPTION value="translate">Перевод</OPTION>
                        <OPTION value="dialog">Диалог</OPTION>
                        <OPTION value="grammar">Грамматика</OPTION>
                        <OPTION value="word">Слова</OPTION>
                        <OPTION value="question">Вопросы</OPTION>
                    </select>
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <input type="hidden" name="id" value="<#if task??>${task.id}</#if>" />

                <div class="form-group">
                    <button type="submit" class="btn btn-primary">Сохранить</button>
                </div>

            </form>
        </div>
    </div>