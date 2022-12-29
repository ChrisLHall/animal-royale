var moveAngle = random_range(0, 360);
var randomMove = [cos(moveAngle), -sin(moveAngle)];
var move = randomMove;

var closest = findClosestTargets();
var currentSpeed = MOVE_SPEED;
var scared = false;

var followPrey = instance_exists(closest.targetPrey) and (!FF_RUN_AWAY or closest.targetPreyDist < closest.targetPredatorDist);
var runFromPredator = FF_RUN_AWAY and instance_exists(closest.targetPredator) and closest.targetPredatorDist < closest.targetPreyDist;
if (followPrey) {
	var delta = [closest.targetPrey.x - x, closest.targetPrey.y - y];
	move = vector_add(vector_normalize(delta), vector_multiply(randomMove, PERTURBATION));
} else if (runFromPredator) {
	var delta = [closest.targetPredator.x - x, closest.targetPredator.y - y];
	move = vector_add(vector_multiply(vector_normalize(delta), -1), vector_multiply(randomMove, PERTURBATION));
	scared = true;
}

move = vector_multiply(vector_normalize(move), MOVE_SPEED);
if (scared) {
	move = vector_multiply(move, .9);
}

x += move[0];
y += move[1];
x = clamp(x, oAnimalManager.SPAWN_PADDING, room_width - 2 * oAnimalManager.SPAWN_PADDING);
y = clamp(y, oAnimalManager.SPAWN_PADDING, room_height - 2 * oAnimalManager.SPAWN_PADDING);

if (abs(move[0]) > MOVE_SPEED * .5) {
	image_xscale = (move[0] > 0 ? -1 : 1) * abs(image_xscale);
}

// anim
if (scared) {
	image_speed = 0;
	image_index = 3;
} else {
	image_speed = .1;
	if (image_index >= 2) {
		image_index = 0;
	}
}