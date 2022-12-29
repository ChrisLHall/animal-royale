/// @description 

animal_type = -1;
animal_beats = -1;

image_speed = 0.1;
image_xscale = 2;
image_yscale = 2;

function setType(type, beats) {
	animal_type = type;
	animal_beats = beats;
	sprite_index = animal_type;
}


function findClosestTarget() {
	var target = noone;
	var targetDist = 0;
	with (oAnimalFighter) {
		if (self == other) continue;
		if (!other.beats(self)) continue;
		var dist = distance_to_object(other);
		if (target == noone or targetDist > dist) {
			target = self;
			targetDist = dist;
		}
	}
	return target;
}

function beats(animal) {
	if (is_array(animal_beats)) {
		return array_index_of(animal_beats, animal.animal_type) != -1;
	} else {
		return animal.animal_type == animal_beats;
	}
}
