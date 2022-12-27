<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main"/>
        <asset:stylesheet src="custom/common.css"/>
        <asset:stylesheet src="custom/edit.css"/>
        <title>Edit hotel</title>
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
            <label class="page_content__title">Изменить отель</label>
            <g:form controller="hotel">
                <g:hasErrors bean="${hotel}">
                    <g:eachError><p><g:message code="${errorCode}"/></p></g:eachError>
                </g:hasErrors>
                <g:textField style="display: none;" name="id" value="${hotel.id}"/>
                <div class="edit_box">
                    <div class="edit_box__class_field ${hasErrors(bean:hotel, field:'hotel.name', 'errors')}">
                        <label class="edit_box__class_field__field_name">Name: </label>
                        <g:field class="edit_box__class_field__input_field" type="text" required="" maxlength="255" name="name" value="${hotel.name}"/>
                    </div>
                    <div class="edit_box__class_field ${hasErrors(bean:hotel, field:'hotel.stars', 'errors')}">
                        <label class="edit_box__class_field__field_name">Stars: </label>
                        <g:field class="edit_box__class_field__input_number_field" type="number" min="1" max="5" required="" name="stars" value="${hotel.stars}"/>
                    </div>
                    <div class="edit_box__class_field ${hasErrors(bean:hotel, field:'hotel.link', 'errors')}">
                        <label class="edit_box__class_field__field_name ${hasErrors(bean:hotel, field:'hotel.link', 'errors')}">Link: </label>
                        <g:field class="edit_box__class_field__input_field" type="text" pattern="^(http:\\/\\/|https:\\/\\/).*" name="link" value="${hotel.link}"/>
                    </div>
                </div>
                <div class="bottom_menu">
                    <g:actionSubmit class="bottom_menu__button" action="save" value="Сохранить"/>
                </div>
            </g:form>
        </div>
    </body>
</html>