
var allSameType = noone;
var allSame = true;
with (oAnimalFighter) {
	if (allSameType == noone) {
		allSameType = animal_type;
	} else if (animal_type != allSameType) {
		allSame = false;
		break;
	}
}
if (allSame) {
	sprite_index = allSameType;
	if (image_alpha == 0) {
		alarm_set(0, room_speed * 5);
	}
	image_alpha = min(image_alpha + 0.01, 0.2);
} else {
	image_alpha = 0;
	alarm_set(0, -1);
}
