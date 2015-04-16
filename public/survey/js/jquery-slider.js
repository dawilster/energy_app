$(function() {
// set up an array to hold the coolness
var coolness = ["Burning", " ", " "," ", "Normal", " "," ", " ", "Freezing"];
var noisyness = ["Silence", " ", " "," ", "Normal", " ", " "," ", "Super Noisy"];

  $("#slider-cold").slider({
    animate:"medium",
    orientation: "horizontal",
    min: 0,
    max: coolness.length-1,
    value: 4,
    slide: function( event, ui ) {
              var coldlevel=ui.value;
              var feeling="Normal";
              switch(coldlevel) {
                case 0:
                    feeling="Burning";
                    break;
                case 1:
                    feeling="Very Hot";
                    break;
                case 2:
                    feeling="Hot";
                    break;
                case 3:
                    feeling="a bit Hot";
                    break;
                case 4:
                    feeling="Normal";
                    break;
                case 5:
                    feeling="a bit Cold";
                    break;
                case 6:
                    feeling="Cold";
                    break;
                case 7:
                    feeling="Very Cold";
                    break;
                case 8:
                    feeling="Freezing";
                    break;
              }
              $( "#cool" ).val(feeling);
              $( "#cool_level" ).val(coldlevel);   
            }

  })
  .slider("pips", {
        rest: "label",
        labels: coolness
  });

  $("#slider-noisy").slider({
    animate:"medium",
    orientation: "horizontal",
    min: 0,
    max: noisyness.length-1,
    value: 4,
    slide: function( event, ui ) {
              var coldlevel=ui.value;
              var feeling="Normal";
              switch(coldlevel) {
                case 0:
                    feeling="Silence";
                    break;
                case 1:
                    feeling="Very Quiet";
                    break;
                case 2:
                    feeling="Quiet";
                    break;
                case 3:
                    feeling="a bit Quiet";
                    break;
                case 4:
                    feeling="Normal";
                    break;
                case 5:
                    feeling="a bit Noisy";
                    break;
                case 6:
                    feeling="Noisy";
                    break;
                case 7:
                    feeling="Very Noisy";
                    break;
                case 6:
                    feeling="Super Noisy";
                    break;
              }
              $( "#noise" ).val(feeling);
              $( "#noise_level" ).val(coldlevel);  
            }

  })
  .slider("pips", {
        rest: "label",
        labels: noisyness
  });

});