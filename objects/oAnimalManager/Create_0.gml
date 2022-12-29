/// @description 

// the first in a pair is the type of animal. The second is who they can beat.
animal_types = [
	[sChicken, sSnake],
	[sLion, sChicken],
	[sSnake, sLion],
];


function assignStartingType(animalFighter) {
	var entry = animal_types[irandom_range(0, array_length(animal_types) - 1)];
	animalFighter.setType(entry[0], entry[1]);
}


for (var i = 0; i < SPAWN_COUNT; i++) {
	var animal = instance_create_layer(irandom_range(SPAWN_PADDING, room_width - 2 * SPAWN_PADDING), irandom_range(SPAWN_PADDING, room_width - 2 * SPAWN_PADDING), "Instances", oAnimalFighter);
	assignStartingType(animal);
}
	