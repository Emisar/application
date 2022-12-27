<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main"/>
        <asset:stylesheet src="custom/common.css"/>
        <asset:stylesheet src="custom/edit.css"/>
        <title>Edit country</title>
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
            <label class="page_content__title">Изменить страну</label>
            <g:form controller="country">
                <g:hasErrors bean="${country}">
                    <g:eachError><p><g:message code="${errorCode}"/></p></g:eachError>
                </g:hasErrors>
                <g:textField style="display: none;" name="id" value="${country.id}"/>
                <div class="edit_box">
                    <div class="edit_box__class_field ${hasErrors(bean:country, field:'country.name', 'errors')}">
                        <label class="edit_box__class_field__field_name">Name: </label>
                        <g:field class="edit_box__class_field__input_field" type="text" required="" maxlength="255" name="name" value="${country.name}"/>
                    </div>
                    <div class="edit_box__class_field ${hasErrors(bean:country, field:'country.capital', 'errors')}">
                        <label class="edit_box__class_field__field_name">Capital: </label>
                        <g:field class="edit_box__class_field__input_field" type="text" required="" maxlength="128" name="capital" value="${country.capital}"/>
                    </div>
                    <div class="edit_box__class_field">
                        <label class="edit_box__class_field__field_name">Hotels: </label>
                        <g:select class="edit_box__class_field__select" name="hotels" from="${hotels}" optionKey="id" multiple="true" value="${country.hotels*.hotel.id}"/>
                    </div>
                </div>
                <div class="bottom_menu">
                    <g:actionSubmit class="bottom_menu__button" action="save" value="Сохранить"/>
                </div>
            </g:form>
        </div>
    </body>
</html>