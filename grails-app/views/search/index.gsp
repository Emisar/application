<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main"/>
        <asset:stylesheet src="custom/common.css"/>
        <asset:stylesheet src="custom/search.css"/>
        <asset:stylesheet src="custom/pagination.css"/>
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
            <label class="page_content__title">Поиск отеля</label>
            <g:form controller="search">
                <div class="search_box">
                    <g:select class="search_box__select_country" name="countryId" from="${model.searchField.countries}" optionKey="id" value="${model.searchField.countryId}" noSelection="${['-1':'Any']}"/>
                    <g:textField class="search_box__input_field" name="searchString" value="${model.searchField.searchString}"/>
                    <g:actionSubmit class="search_box__button" action="search" value="Найти"/>
                </div>
                <g:if test="${model.resultField != null}">
                    <div class="search_result_box">
                        <label class="search_result_box__title">Найдено результатов: ${model.resultField.totalCount}</label>
                        <div class="result_table_box">
                            <div class="result_table_box__title">
                                <div class="result_table_box__title__cell">
                                    <label class="result_table_box__title__cell__label">Название отеля</label>
                                </div>
                                <div class="result_table_box__title__cell">
                                    <label class="result_table_box__title__cell__label">Количество звезд</label>
                                </div>
                            </div>
                            <g:render template="resultRowTemplate" collection="${model.resultField.hotels}" var="hotel"/>
                        </div>
                    </div>
                </g:if>
                <g:if test="${pagination != null}">
                    <div class="pagination_box">
                        <g:paginate action="search"
                                    max="${pagination.max}"
                                    total="${pagination.totalCount}"
                                    params="[countryId: searchParam.countryId,
                                             searchString: searchParam.searchString
                                    ]"
                        />
                    </div>
                </g:if>
            </g:form>
        </div>
    </body>
</html>