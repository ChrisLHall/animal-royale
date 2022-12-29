// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function LinearStepTowards(obj, targetX, targetY, moveSpeed) {
	var dist = point_distance(obj.x, obj.y, targetX, targetY);
	if (dist > moveSpeed) {
		obj.x += (targetX - obj.x) / dist * moveSpeed;
		obj.y += (targetY - obj.y) / dist * moveSpeed;
	} else {
		obj.x = targetX;
		obj.y = targetY;
	}
}