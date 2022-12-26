<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main"/>
        <asset:stylesheet src="custom/common.css"/>
        <asset:stylesheet src="custom/show.css"/>
        <title>Show hotel</title>
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
            <label class="page_content__title">Просмотр отеля</label>
            <g:form controller="hotel">
                <g:textField style="display: none;" name="id" value="${hotel.id}"/>
                <div class="show_box">
                    <div class="show_box__class_field">
                        <label class="show_box__class_field__field_name">Name: </label>
                        <label class="show_box__class_field__field_value">${hotel.name}</label>
                    </div>
                    <div class="show_box__class_field">
                        <label class="show_box__class_field__field_name">Stars: </label>
                        <label class="show_box__class_field__field_value">
                            <g:each var="i" in="${(0..<hotel?.stars)}">
                                *
                            </g:each>
                        </label>
                    </div>
                    <div class="show_box__class_field">
                        <label class="show_box__class_field__field_name">Link: </label>
                        <g:if test="${hotel?.link == ''}">
                            <label class="show_box__class_field__field_value">-</label>
                        </g:if>
                        <g:else>
                            <a href="${hotel.link}" class="show_box__class_field__field_value">Перейти на сайт</a>
                        </g:else>
                    </div>
                </div>
                <div class="bottom_menu">
                    <g:actionSubmit class="bottom_menu__button" action="edit" value="Изменить"/>
                    <g:actionSubmit class="bottom_menu__button" action="delete" value="Удалить"/>
                </div>
            </g:form>
        </div>
    </body>
</html>