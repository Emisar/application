<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main"/>
        <asset:stylesheet src="custom/common.css"/>
        <asset:stylesheet src="custom/create.css"/>
        <title>Create country</title>
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
            <label class="page_content__title">Добавить страну</label>
            <g:form controller="country">
                <g:hasErrors bean="${country}">
                    <g:eachError><p><g:message code="${errorCode}"/></p></g:eachError>
                </g:hasErrors>
                <div class="create_box">
                    <div class="create_box__class_field ${hasErrors(bean:country, field:'country.name', 'errors')}">
                        <label class="create_box__class_field__field_name">Name: </label>
                        <g:field class="create_box__class_field__input_field" type="text" required="" maxlength="255" name="name"/>
                    </div>
                    <div class="create_box__class_field ${hasErrors(bean:country, field:'country.capital', 'errors')}">
                        <label class="create_box__class_field__field_name">Capital: </label>
                        <g:field class="create_box__class_field__input_field" type="text" required="" maxlength="128" name="capital"/>
                    </div>
                    <div class="create_box__class_field">
                        <label class="create_box__class_field__field_name">Hotels: </label>
                        <g:select class="create_box__class_field__select" name="hotels" from="${hotels}" optionKey="id" multiple="true"/>
                    </div>
                </div>
                <div class="bottom_menu">
                    <g:actionSubmit class="bottom_menu__button" action="save" value="Сохранить"/>
                </div>
            </g:form>
        </div>
    </body>
</html>