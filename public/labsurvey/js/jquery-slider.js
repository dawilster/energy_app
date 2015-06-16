$(function() {
// set up an array to hold the coolness
var happiness = ["Sad", " ", " "," ", "Normal", " ", " "," ", "Happy"];
var excitedness = ["Bored", " ", " "," ", "Normal", " ", " "," ", "Excited"];
var safeness = ["Scare", " ", " "," ", "Normal", " ", " "," ", "Safe"];
var peacefulness = ["Angry", " ", " "," ", "Normal", " ", " "," ", "Peace"];

  $("#slider-happy").slider({
    animate:"medium",
    orientation: "horizontal",
    min: 0,
    max: happiness.length-1,
    value: 4,
    slide: function( event, ui ) {
              var happylevel=ui.value;
              var feeling="0";
              switch(happylevel) {
                case 0:
                    feeling="-4";
                    break;
                case 1:
                    feeling="-3";
                    break;
                case 2:
                    feeling="-2";
                    break;
                case 3:
                    feeling="-1";
                    break;
                case 4:
                    feeling="0";
                    break;
                case 5:
                    feeling="1";
                    break;
                case 6:
                    feeling="2";
                    break;
                case 7:
                    feeling="3";
                    break;
                case 8:
                    feeling="4";
                    break;
              }
              $( "#happy" ).val(feeling);
              $( "#happy_level" ).val(feeling);  
            }

  })
  .slider("pips", {
        rest: "label",
        labels: happiness
  });

  $("#slider-excited").slider({
    animate:"medium",
    orientation: "horizontal",
    min: 0,
    max: excitedness.length-1,
    value: 4,
    slide: function( event, ui ) {
              var excitedlevel=ui.value;
              var feeling="Normal";
              switch(excitedlevel) {
                case 0:
                    feeling="-4";
                    break;
                case 1:
                    feeling="-3";
                    break;
                case 2:
                    feeling="-2";
                    break;
                case 3:
                    feeling="-1";
                    break;
                case 4:
                    feeling="0";
                    break;
                case 5:
                    feeling="1";
                    break;
                case 6:
                    feeling="2";
                    break;
                case 7:
                    feeling="3";
                    break;
                case 8:
                    feeling="4";
                    break;
              }
              $( "#excited" ).val(feeling); // pass value to input form to show value
              $( "#excited_level" ).val(feeling); //pass value to hidden input in the form   
            }

  })
  .slider("pips", {
        rest: "label",
        labels: excitedness
  });

  $("#slider-safe").slider({
    animate:"medium",
    orientation: "horizontal",
    min: 0,
    max: safeness.length-1,
    value: 4,
    slide: function( event, ui ) {
              var safelevel=ui.value;
              var feeling="Normal";
              switch(safelevel) {
                case 0:
                    feeling="-4";
                    break;
                case 1:
                    feeling="-3";
                    break;
                case 2:
                    feeling="-2";
                    break;
                case 3:
                    feeling="-1";
                    break;
                case 4:
                    feeling="0";
                    break;
                case 5:
                    feeling="1";
                    break;
                case 6:
                    feeling="2";
                    break;
                case 7:
                    feeling="3";
                    break;
                case 8:
                    feeling="4";
                    break;
              }
              $( "#safe" ).val(feeling); // pass value to input form to show value
              $( "#safe_level" ).val(feeling); //pass value to hidden input in the form   
            }

  })
  .slider("pips", {
        rest: "label",
        labels: safeness
  });

  $("#slider-peace").slider({
    animate:"medium",
    orientation: "horizontal",
    min: 0,
    max: peacefulness.length-1,
    value: 4,
    slide: function( event, ui ) {
              var peacelevel=ui.value;
              var feeling="Normal";
              switch(peacelevel) {
                case 0:
                    feeling="-4";
                    break;
                case 1:
                    feeling="-3";
                    break;
                case 2:
                    feeling="-2";
                    break;
                case 3:
                    feeling="-1";
                    break;
                case 4:
                    feeling="0";
                    break;
                case 5:
                    feeling="1";
                    break;
                case 6:
                    feeling="2";
                    break;
                case 7:
                    feeling="3";
                    break;
                case 8:
                    feeling="4";
                    break;
              }
              $( "#peace" ).val(feeling); // pass value to input form to show value
              $( "#peace_level" ).val(feeling); //pass value to hidden input in the form   
            }

  })
  .slider("pips", {
        rest: "label",
        labels: peacefulness
  });


});