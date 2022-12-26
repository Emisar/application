<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main"/>
        <asset:stylesheet src="custom/common.css"/>
        <asset:stylesheet src="custom/table.css"/>
        <title>Country list</title>
    </head>
    <body>
        <label class="main_title">Хочу Отель</label>
        <div class="upper_menu">
            <g:form controller="hotel">
                <g:actionSubmit class="upper_menu__button" action="list" value="Отели"/>
            </g:form>
            <g:form controller="country">
                <g:actionSubmit class="upper_menu__button" action="list" value="Страны"/>
            </g:form>
            <g:form controller="search">
                <g:actionSubmit class="upper_menu__button" action="index" value="Поиск"/>
            </g:form>
        </div>
        <div class="page_content">
            <label class="page_content__title">Список стран</label>
            <g:form controller="country">
                <div class="table_box">
                    <div class="table_box__title">
                        <div class="table_box__title__cell">
                            <label class="table_box__title__cell__label">Название страны</label>
                        </div>
                        <div class="table_box__title__cell">
                            <label class="table_box__title__cell__label">Столица</label>
                        </div>
                        <div class="table_box__title__cell">
                            <label class="table_box__title__cell__label">Доступные отели</label>
                        </div>
                    </div>
                    <g:render template="countryRowTemplate" collection="${countries}" var="country"/>
                </div>
                <div class="bottom_menu">
                    <g:actionSubmit class="bottom_menu__button" action="create" value="Добавить"/>
                </div>
            </g:form>
        </div>
    </body>
</html>