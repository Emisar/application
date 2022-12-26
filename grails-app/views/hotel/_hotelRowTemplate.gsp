<div class="table_box__row">
  <div class="table_box__row__cell">
    <g:link action="show" id="${hotel?.id}">
      <label class="table_box__row__cell__label">${hotel?.name}</label>
    </g:link>
    <g:if test="${hotel?.link != ''}">
      <a href="${hotel?.link}" class="table_box__row__cell__link">Перейти на сайт</a>
    </g:if>
  </div>
  <div class="table_box__row__cell">
    <label class="table_box__row__cell__label">
      <g:each var="i" in="${(0..<hotel?.stars)}">
        *
      </g:each>
    </label>
  </div>
</div>