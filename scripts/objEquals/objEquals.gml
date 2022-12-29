// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function objEquals(obj1, obj2){
	if (obj1 == noone && obj2 == noone) {
		return true;
	}
	if (obj1 == noone || obj2 == noone) {
		return false;
	}
	return obj1.id == obj2.id;
}