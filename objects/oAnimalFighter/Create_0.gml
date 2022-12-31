/// @description 

animal_type = -1;
animal_beats = -1;

image_xscale = 2;
image_yscale = 2;

function setType(type, beats) {
	animal_type = type;
	animal_beats = beats;
	sprite_index = animal_type;
}


function findClosestTargets() {
	var targetPrey = noone;
	var targetPreyDist = 100000;
	var targetPredator = noone;
	var targetPredatorDist = 100000;
	with (oAnimalFighter) {
		if (self == other) continue;
		if (self.animal_type == other.animal_type) continue;
		var dist = distance_to_object(other);
		if (other.beats(self)) {
			if (targetPreyDist > dist) {
				targetPrey = self;
				targetPreyDist = dist;
			}
		} else {
			if (targetPredatorDist > dist) {
				targetPredator = self;
				targetPredatorDist = dist;
			}
		}
	}
	return {
		targetPrey: targetPrey,
		targetPreyDist: targetPreyDist,
		targetPredator: targetPredator,
		targetPredatorDist: targetPredatorDist,
	};
}

function beats(animal) {
	if (is_array(animal_beats)) {
		return array_index_of(animal_beats, animal.animal_type) != -1;
	} else {
		return animal.animal_type == animal_beats;
	}
}
