<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main"/>
        <asset:stylesheet src="custom/common.css"/>
        <asset:stylesheet src="custom/create.css"/>
        <title>Create hotel</title>
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
            <label class="page_content__title">Добавить отель</label>
            <g:form controller="hotel">
                <g:hasErrors bean="${hotel}">
                    <g:eachError><p><g:message code="${errorCode}"/></p></g:eachError>
                </g:hasErrors>
                <div class="create_box">
                    <div class="create_box__class_field ${hasErrors(bean:hotel, field:'hotel.name', 'errors')}">
                        <label class="create_box__class_field__field_name">Name: </label>
                        <g:field class="create_box__class_field__input_field" type="text" required="" maxlength="255" name="name"/>
                    </div>
                    <div class="create_box__class_field ${hasErrors(bean:hotel, field:'hotel.stars', 'errors')}">
                        <label class="create_box__class_field__field_name">Stars: </label>
                        <g:field class="create_box__class_field__input_number_field" type="number" min="1" max="5" required="" name="stars"/>
                    </div>
                    <div class="create_box__class_field ${hasErrors(bean:hotel, field:'hotel.link', 'errors')}">
                        <label class="create_box__class_field__field_name">Link: </label>
                        <g:field class="create_box__class_field__input_field" type="text" pattern="^(http:\\/\\/|https:\\/\\/).*" name="link"/>
                    </div>
                </div>
                <div class="bottom_menu">
                    <g:actionSubmit class="bottom_menu__button" action="save" value="Сохранить"/>
                </div>
            </g:form>
        </div>
    </body>
</html>