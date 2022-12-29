if (other.beats(self)) {
	setType(other.animal_type, other.animal_beats);
}

var delta = [x - other.x, y - other.y];
delta = vector_multiply(vector_normalize(delta), MOVE_SPEED);
x += delta[0];
y += delta[1];