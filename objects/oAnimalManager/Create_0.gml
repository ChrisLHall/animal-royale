/// @description 


// I want one main cycle, with one branch and one offshoot
// main: grizzly -> moose -> wolf -> chicken -> snake
// side: mouse -> elephant/giraffe -> wolf -> owl

// the first in a pair is the type of animal. The second is who they can beat.
/*
animal_types = [
	[sChicken, sSnake],
	[sWolf, [sChicken, sOwl]],
	[sSnake, sGrizzly],
	[sGrizzly, sMoose],
	[sMoose, sWolf],
	[sOwl, sRat],
	[sRat, [sElephant, sGiraffe]],
	[sElephant, sWolf],
	[sGiraffe, sWolf],
];
*/
/*
animal_types = [
	[sLion, [sElephant, sGiraffe]],
	[sElephant, [sGiraffe, sSnake, sOwl, sTurtle]],
	[sGiraffe, [sOwl, sRat, sTurtle]],
	[sOwl, [sSnake, sLion, sRat]],
	[sSnake, [sRat, sLion, sGiraffe]],
	[sRat, [sLion, sElephant, sTurtle]],
	[sTurtle, [sLion, sOwl, sSnake]],
]
*/
animal_types = [
	[sLion, [sElephant, sGiraffe, sTurtle]],
	[sElephant, [sGiraffe, sTurtle, sOwl]],
	[sGiraffe, [sTurtle, sOwl, sSnake]],
	[sTurtle, [sOwl, sSnake, sRat]],
	[sOwl, [sSnake, sRat, sLion]],
	[sSnake, [sRat, sLion, sElephant]],
	[sRat, [sLion, sElephant, sGiraffe]],
]

function assignStartingType(animalFighter) {
	var entry = animal_types[irandom_range(0, array_length(animal_types) - 1)];
	animalFighter.setType(entry[0], entry[1]);
}

function setupField() {
	for (var i = 0; i < SPAWN_COUNT; i++) {
		createRandomAnimal();
	}
}

function createRandomAnimal() {
	var animal = instance_create_layer(irandom_range(SPAWN_PADDING, room_width - 2 * SPAWN_PADDING), irandom_range(SPAWN_PADDING, room_width - 2 * SPAWN_PADDING), "Instances", oAnimalFighter);
	assignStartingType(animal);
}

function destroyRandomAnimal() {
	var count = instance_number(oAnimalFighter);
	var randIndex = irandom_range(0, count - 1);
	with (oAnimalFighter) {
		if (randIndex == 0) {
			instance_destroy();
			break;
		}
		randIndex--;
	}
}

setupField();