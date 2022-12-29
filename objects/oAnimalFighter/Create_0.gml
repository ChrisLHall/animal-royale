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
	var targetPrey = noone;
	var targetPreyDist = 0;
	var targetPredator = noone;
	var targetPredatorDist = 0;
	with (oAnimalFighter) {
		if (self == other) continue;
		var dist = distance_to_object(other);
		if (other.beats(self)) {
			if (targetPrey == noone or targetPreyDist > dist) {
				targetPrey = self;
				targetPreyDist = dist;
			}
		} else if (self.beats(other)) {
			if (targetPredator == noone or targetPredatorDist > dist) {
				targetPredator = self;
				targetPredatorDist = dist;
			}
		}
	}
	return [targetPrey, targetPredator];
}

function beats(animal) {
	if (is_array(animal_beats)) {
		return array_index_of(animal_beats, animal.animal_type) != -1;
	} else {
		return animal.animal_type == animal_beats;
	}
}
