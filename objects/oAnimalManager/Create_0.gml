/// @description 


// I want one main cycle, with one branch and one offshoot
// main: grizzly -> moose -> wolf -> chicken -> snake
// side: mouse -> elephant/giraffe -> wolf -> owl

// the first in a pair is the type of animal. The second is who they can beat.
// this one doesn't work because it isn't fully connected
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
// this one tends to have Elephant and Rat win
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
// this one is good
/*
animal_types = [
	[sLion, [sElephant, sGiraffe, sTurtle]],
	[sElephant, [sGiraffe, sTurtle, sOwl]],
	[sGiraffe, [sTurtle, sOwl, sSnake]],
	[sTurtle, [sOwl, sSnake, sRat]],
	[sOwl, [sSnake, sRat, sLion]],
	[sSnake, [sRat, sLion, sElephant]],
	[sRat, [sLion, sElephant, sGiraffe]],
]
*/

// must be an odd number of animals to work correctly
function createBalancedTypesArray(animalList) {
	var numAnimals = array_length(animalList);
	var numBeat = (numAnimals - 1) / 2;
	var result = [];
	for (var i = 0; i < numAnimals; i++) {
		var beats = [];
		for (var j = 0; j < numBeat; j++) {
			array_push(beats, animalList[(i + 1 + j) mod numAnimals]);
		}
		array_push(result, [animalList[i], beats]);
	}
	return result;
}
animal_types = createBalancedTypesArray([sGrizzly, sPanda, sLion, sRhino, sElephant, sMoose, sBull, sGiraffe, sPig, sSheep, sTurtle, sPenguin, sRacoon, sCat, sOwl, sSnake, sFrog, sChicken, sRat]);


function assignStartingType(animalFighter) {
	var entry = animal_types[irandom_range(0, array_length(animal_types) - 1)];
	animalFighter.setType(entry[0], entry[1]);
}

function fullReset() {
	with (oAnimalFighter) {
		instance_destroy();
	}

	setupField();
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

fullReset();