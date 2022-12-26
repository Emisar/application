<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main"/>
        <asset:stylesheet src="custom/common.css"/>
        <asset:stylesheet src="custom/table.css"/>
        <title>Hotel list</title>
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
            <g:form controller="hotel">
                <div class="table_box">
                    <div class="table_box__title">
                        <div class="table_box__title__cell">
                            <label class="table_box__title__cell__label">Название отеля</label>
                        </div>
                        <div class="table_box__title__cell">
                            <label class="table_box__title__cell__label">Количество звезд</label>
                        </div>
                    </div>
                    <g:render template="hotelRowTemplate" collection="${hotels}"/>
                </div>
                <div class="bottom_menu">
                    <g:actionSubmit class="bottom_menu__button" action="create" value="Добавить"/>
                </div>
            </g:form>
        </div>
    </body>
</html>