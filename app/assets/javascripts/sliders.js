$(function(){

});

function initSlider(slider, hidden_input, display_element, default_value, min, max){
    default_value = default_value || 5;
    min = min || 0;
    max = max || 10;
  $( slider ).slider({

    value: default_value,
    min: min,
    max: max,
    step: 1,
    slide: function( event, ui ) {
      $(hidden_input).val(ui.value); //update form value
      $(display_element).text(ui.value); //update form value
    }
  });

  //init values
  $(display_element).text($(slider).slider( "value" ));
  $(hidden_input).val($(slider).slider( "value" )); //update form value

}