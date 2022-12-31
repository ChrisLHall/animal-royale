if (other.beats(self)) {
	setType(other.animal_type, other.animal_beats);
	if (!oMuteButton.mute) {
		audio_play_sound(blipSelect, 2, false, 1, 0, random_range(.8, 1.2));
	}
}

var delta = [x - other.x, y - other.y];
delta = vector_multiply(vector_normalize(delta), MOVE_SPEED);
x += delta[0];
y += delta[1];