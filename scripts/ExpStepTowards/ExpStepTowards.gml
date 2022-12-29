// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ExpStepTowards(obj, targetX, targetY, factor, tolerance, maxStep){
	var deltaX = (targetX - obj.x) * factor;
	var deltaY = (targetY - obj.y) * factor;
	var stepSize = sqrt(sqr(deltaX) + sqr(deltaY));
	
	if (point_distance(obj.x, obj.y, targetX, targetY) <= tolerance) {
		obj.x = targetX;
		obj.y = targetY;
	} else if (stepSize > maxStep) {
		LinearStepTowards(obj, targetX, targetY, maxStep);
	} else {
		obj.x += deltaX;
		obj.y += deltaY;
	}
}