<#import "parts/common.ftl" as c>

<@c.page>
<div class="form-row">
    <div class="form-group col-md-6">
        <form method="get" action="/main" class="form-inline">

            <select class="form-control" name="filter">
                <OPTION value="0">Выберите уровень</OPTION>
                <OPTION value="1">Elementary</OPTION>
                <OPTION value="2">Pre-Intermediate</OPTION>
                <OPTION value="3">Intermediate</OPTION>
                <OPTION value="4">Upper-Intermediate</OPTION>
                <OPTION value="5">Advanced</OPTION>
                <OPTION value="6">Proficiency</OPTION>
            </select>
            <select class="form-control" name="type">
                <OPTION value="">Выберите тип</OPTION>
                <OPTION value="translate">Перевод</OPTION>
                <OPTION value="dialog">Диалог</OPTION>
                <OPTION value="grammar">Грамматика</OPTION>
                <OPTION value="word">Слова</OPTION>
                <OPTION value="question">Вопросы</OPTION>
            </select>
            <button type="submit" class="btn btn-primary ml-2">Найти</button>
        </form>
    </div>
</div>


    <#include "parts/taskEditor.ftl" />
    <#include "parts/TaskList.ftl" />


</@c.page>