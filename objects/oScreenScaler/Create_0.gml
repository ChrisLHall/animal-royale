base_width = room_width;
base_height = room_height;
width = base_width;
height = base_height;


/// @function                       scale_canvas(base width, base height, current width, current height, center);
/// @param {int}    base width      The base width for the game room
/// @param {int}    base height     The base height for the game room
/// @param {int}    current width   The current width of the game canvas
/// @param {int}    current height  The current height of the game canvas
/// @param {bool}   center          Set whether to center the game window on the canvas or not
function scaleCanvas(baseWidth, baseHeight, currentWidth, currentHeight, shouldCenter) {
	var aspect = (baseWidth / baseHeight);

	if ((currentWidth / aspect) > currentHeight) {
	    window_set_size((currentHeight *aspect), currentHeight);
	} else {
	    window_set_size(currentWidth, (currentWidth / aspect));
	}
	if (shouldCenter) {
	    window_center();
	}

	surface_resize(application_surface, min(window_get_width(), baseWidth), min(window_get_height(), baseHeight));
}
