// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
// vector is an array [x, y]
function vector_normalize(vector) {
	if (vector[0] == 0 and vector[1] == 0) return vector;
	var magnitude = vector_magnitude(vector);
	return [vector[0] / magnitude, vector[1] / magnitude];
}