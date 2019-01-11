class Paddle {
  
  float paddlew = 80;
  float paddleh = 20;
  float paddlex = 640 - paddlew/2;
  float paddley = 690;
  float MAX_X = 745;
  float MIN_X = 530;

  private void update() {
    float direction = 0;
    float paddleSpeed = 8;
    //if keysPressed returns true set the direction to either left or right depending on which key is pressed
    if (keysPressed[LEFT] && paddlex > MIN_X) direction = -1;
    if (keysPressed[RIGHT] && paddlex + paddlew < MAX_X) direction = 1;
    //add more speed to the paddle
    paddlex += direction * paddleSpeed;
  }

  private boolean paddleCollision() {  

    if ((ball.y + ball.radius >= paddley) && 
      (ball.x + ball.radius > paddlex) &&
      (ball.x - ball.radius < paddlex + paddlew)) {
      return true;
    }
    return false;
  }

  private void draw() {
    update();
    rect(paddlex, paddley, paddlew, paddleh);

    boolean hit = paddleCollision();
    if (hit) {
      ball.yspeed *= ball.bounce;
      ball.yspeed *= ball.gravity;
      ball.y += ball.yspeed;
    }
  }
}
