<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main"/>
        <asset:stylesheet src="custom/common.css"/>
        <asset:stylesheet src="custom/show.css"/>
        <title>Show country</title>
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
            <label class="page_content__title">Просмотр страны</label>
            <g:form controller="country">
                <g:textField style="display: none;" name="id" value="${country.id}"/>
                <div class="show_box">
                    <div class="show_box__class_field">
                        <label class="show_box__class_field__field_name">Name: </label>
                        <label class="show_box__class_field__field_value">${country.name}</label>
                    </div>
                    <div class="show_box__class_field">
                        <label class="show_box__class_field__field_name">Capital: </label>
                        <label class="show_box__class_field__field_value">${country.capital}</label>
                    </div>
                    <div class="show_box__class_field">
                        <label class="show_box__class_field__field_name">Hotels: </label>
                        <div class="show_box__class_field__field_multi_value">
                            <g:each in="${country.hotels}" var="hotel">
                                <label class="show_box__class_field__field_multi_value__label">${hotel.hotel?.name}</label>
                            </g:each>
                        </div>
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