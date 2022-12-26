<div class="table_box__row">
  <div class="table_box__row__cell">
    <g:link action="show" id="${country?.id}">
      <label class="table_box__row__cell__label">${country?.name}</label>
    </g:link>
  </div>
  <div class="table_box__row__cell">
    <label class="table_box__row__cell__label">${country?.capital}</label>
  </div>
  <div class="table_box__row__cell">
    <g:each var="hotel" in="${country?.hotels}">
      <label class="table_box__row__cell__label">${hotel.hotel?.name}</label>
    </g:each>
  </div>
</div>