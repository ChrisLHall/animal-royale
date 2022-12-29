/// @description 

animal_type = -1;
animal_beats = -1;

image_speed = 0.1;

function setType(animalPair) {
	animal_type = animalPair[0];
	animal_beats = animalPair[1];
	sprite_index = animal_type;
}


//oAnimalManager.assignStartingType(self);
