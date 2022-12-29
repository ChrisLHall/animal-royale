var moveAngle = random_range(0, 360);
var randomMove = [cos(moveAngle), -sin(moveAngle)];
var move = randomMove;

var targets = findClosestTarget();
var prey = targets[0];
var predator = targets[1];
var currentSpeed = MOVE_SPEED;
if (instance_exists(prey)) {
	var delta = [prey.x - x, prey.y - y];
	move = vector_add(vector_normalize(delta), vector_multiply(randomMove, PERTURBATION));
} else if (FF_RUN_AWAY and instance_exists(predator)) {
	var delta = [predator.x - x, predator.y - y];
	move = vector_add(vector_multiply(vector_normalize(delta), -1), vector_multiply(randomMove, PERTURBATION));
	currentSpeed *= .5;
}

move = vector_multiply(vector_normalize(move), MOVE_SPEED);

// todo targeting
x += move[0];
y += move[1];
x = clamp(x, oAnimalManager.SPAWN_PADDING, room_width - 2 * oAnimalManager.SPAWN_PADDING);
y = clamp(y, oAnimalManager.SPAWN_PADDING, room_height - 2 * oAnimalManager.SPAWN_PADDING);

image_xscale = (move[0] > 0 ? -1 : 1) * abs(image_xscale);