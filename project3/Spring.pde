public class Spring {
  //Setting up variables to use in the spring
  public float w = 50;
  public float h = 10;
  private PVector location;
  private boolean shoot;
  private float springSpeed = 20;  
  private float springFriction = 0.8;

  public Spring(float x, float y) {
    location = new PVector(x, y);
  }

  //Setting the minimal and maximal y for the spring location
  public final float MIN_Y = 360;
  public final float MAX_Y = 700;
  private float firingSpeed = 0;

  private boolean ballCollision() {
    if (ball.x + ball.radius >= spring.location.x &&
      ball.x - ball.radius < spring.location.x + spring.w &&
      ball.y + ball.radius >= spring.location.y) {
      ball.makeBounceBottom(spring.location.y);
      ball.yspeed -= ball.yspeed * springFriction;
      return true;
    }
    ball.makeBounceBottom(spring.location.y);
    ball.yspeed -= ball.yspeed * springFriction;
    return false;
  }

  private void ballPull() {
    ball.y = location.y - ball.radius;
  }

  private void fireBall() {
    ball.yspeed -= firingSpeed;
    ball.y += ball.yspeed;
  }

  //To be used when the spring is in its intial state, and making sure it gradually goes up rather than instantly jumping to the new location
  private void displaySpring(float springSpeed) {
    float releaseSpeed = 1.5f;
    springSpeed *= releaseSpeed;
    location.y -= springSpeed;
    location.y = Mathf.clamp(location.y, MIN_Y, MAX_Y);
    rect(location.x, location.y, w, h);
  }

  //To be used when the spring has been dragged down
  private void displaySprung(float springSpeed) {
    Float pullingFriction = 0.45f;
    springSpeed *= pullingFriction;
    location.y += springSpeed;
    location.y = Mathf.clamp(location.y, MIN_Y, MAX_Y);
    rect(location.x, location.y, w, h);
  }

  //Checking whether the down key is pressed and adjusting boolean shoot accordingly
  private void keyPressed() {
    if (key == CODED && keyCode == DOWN && !shoot) {
      shoot = !shoot;
    }
  }

  private void keyReleased() {
    if (key == CODED && keyCode == DOWN && shoot) {
      shoot = !shoot;
    }
  }

  private void draw() {
    fill(0, 0, 0);

    if (ball.x + ball.radius >= spring.location.x &&
      ball.x - ball.radius < spring.location.x + spring.w &&
      ball.y + ball.radius >= spring.location.y) {
      ball.makeBounceBottom(spring.location.y);
      ball.yspeed -= ball.yspeed * springFriction;
    }

    //Displaying the correct state of the spring based on the current state of shoot
    if (!shoot) {
      displaySpring(springSpeed);
    } else if (shoot) {
      displaySprung(springSpeed);
    }

    float sdy = MIN_Y + location.y;

    if (ball.x >= width - 60) {
      if (sdy > 720 && sdy <= 805 && shoot) {
        ballCollision();
        if (ballCollision()) {
          firingSpeed = 15;
          ball.yspeed -= firingSpeed;
        }
      } else if (sdy > 805 && sdy <= 890 && shoot) {
        ballCollision();
        if (ballCollision()) {
          firingSpeed = 20;
          ball.yspeed -= firingSpeed;
        }
      } else if (sdy > 890 && sdy <= 975 && shoot) {
        ballCollision();
        if (ballCollision()) {
          firingSpeed = 30;
          ball.yspeed -= firingSpeed;
        }
      } else if (sdy > 975 && sdy <= 1060 && shoot) {
        ballCollision();
        if (ballCollision()) {
          firingSpeed = 40;
          ball.yspeed -= firingSpeed;
        }
      }
    }else if (ball.x < width - 60) {
      firingSpeed = 0;
      displaySpring(springSpeed);
      shoot = false;
    }

    println(firingSpeed);
    println(ball.yspeed);
  }
}
