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
                <div class="create_box">
                    <div class="create_box__class_field">
                        <label class="create_box__class_field__field_name">Name: </label>
                        <g:textField class="create_box__class_field__input_field" name="name"/>
                    </div>
                    <div class="create_box__class_field">
                        <label class="create_box__class_field__field_name">Stars: </label>
                        <g:field class="create_box__class_field__input_number_field" type="number" min="1" max="5" name="stars"/>
                    </div>
                    <div class="create_box__class_field">
                        <label class="create_box__class_field__field_name">Link: </label>
                        <g:field class="create_box__class_field__input_field" type="url" name="link" value=""/>
                    </div>
                </div>
                <div class="bottom_menu">
                    <g:actionSubmit class="bottom_menu__button" action="save" value="Сохранить"/>
                </div>
            </g:form>
        </div>
    </body>
</html>