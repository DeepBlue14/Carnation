// States are mostly <polygon>s here, but some are <path> and some are a <g> of multiple things. Targetting the direct decendenants easiest.
var allStates = $("svg.us > *");

allStates.on("click", function() {
  
  allStates.removeClass("on");
  $(this).addClass("on");
  
});
