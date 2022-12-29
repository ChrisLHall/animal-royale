if (beats(other)) {
	setType(other.animal_type, other.animal_beats);
}

var delta = [x - other.x, y - other.y];
delta = vector_normalize(delta);
x += delta[0];
y += delta[1];