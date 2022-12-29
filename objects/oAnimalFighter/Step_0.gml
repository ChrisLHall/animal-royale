var moveAngle = random_range(0, 360);
var randomMove = [cos(moveAngle), -sin(moveAngle)];
var move = randomMove;

var target = findClosestTarget();
if (instance_exists(target)) {
	var delta = [target.x - x, target.y - y];
	move = vector_add(vector_normalize(delta), vector_multiply(randomMove, PERTURBATION));
}

move = vector_multiply(vector_normalize(move), MOVE_SPEED);

// todo targeting
x += move[0];
y += move[1];
x = clamp(x, 0, room_width);
y = clamp(y, 0, room_height);

image_xscale = (move[0] > 0 ? -1 : 1) * abs(image_xscale);