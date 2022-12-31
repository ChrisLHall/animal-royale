if (image_alpha == 0) {
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
		image_alpha = 0.01
	}
} else {
	image_alpha = min(image_alpha + 0.01, 0.2);
}
