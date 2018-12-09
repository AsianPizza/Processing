public class Ball {
  //setting up some variables to use for the ball
  //PImage PrimaryBall;
  public float gravity = 0.98f;
  public final float bounce = -1;
  public float yspeed = 0;
  public float xspeed = 0;
  public float springFriction = 0.8;
  public float diameter = 30;
  public float radius = diameter/2;
  public float x = 565;
  public float y = 100;
  public float friction = 0.1;
  public float airfriction = 0.0001;
  public float maxspeedx = 20;
  public float maxspeedy = 20;
  public Ball() {
  }
  //public void init(){
  //PrimaryBall = loadImage("testball.png");
  //}

  //detect collision with spring
  public boolean collideWithSpring() { 
    if ((x + radius >= spring.location.x) &&
      (x - radius < spring.location.x + spring.w) &&
      (y + radius > spring.location.y))
    {
      return true;
    }
    return false;
  }
  //method for keeping the ball in the screen using the makeBounce methods
  public void keepInScreen() {
    if (y - radius >= height) {
      makeBounceBottom(height);
    }

    if (y + radius <= 0) {
      makeBounceTop(0);
    }

    if (x - radius < 0) {
      makeBounceLeft(0);
    }

    if (x + radius > width) {
      makeBounceRight(width);
    }
    //Had a little complication where the ball's x would be set to width - 60 when it was bigger than that messing up the initial x value, 
    //made these two so as to make it bounce on either side of the column
    if (x + radius >= width - 60 && !(x - radius > width - 60 - radius)) {
      makeBounceRight(width - 60);
    }

    if (x - radius <= width - 60 && !(x + radius < width - 60 + radius)) {
      makeBounceLeft(width - 60);
    }
  }

  //method for making the ball bounce on something underneath it
  public void makeBounceBottom(float surface) {
    y = surface - radius;
    yspeed *= bounce;
    yspeed -= yspeed * friction;
    y += yspeed;
  }
  //method for making the ball bounce on something above it
  public void makeBounceTop(float surface) {
    y = surface + radius;
    yspeed *= bounce;
    yspeed -= yspeed * friction;
    y += yspeed;
  }
  //Method for making the ball bounce on something to the right
  public void makeBounceRight(float surface) {
    x = surface - radius;
    xspeed *= bounce;
    xspeed -= xspeed * friction;
    x += xspeed;
  }
  //method for making the ball bounce on something to the left
  public void makeBounceLeft(float surface) {
    x = surface + radius;
    xspeed *= bounce;
    xspeed -= xspeed * friction;
    x += xspeed;
  }

  private void draw() {
    strokeWeight(5);
    fill(255, 0, 0);
    //image(PrimaryBall, x, y, diameter, diameter);
    //Giving the ball gravity and base speed values
    if (xspeed > maxspeedx) {
      xspeed = maxspeedx;
    }
    if (yspeed > maxspeedy) {
      yspeed = maxspeedy;
    }
    yspeed += gravity;
    yspeed -= yspeed * airfriction;
    y += yspeed;
    x += xspeed;
    keepInScreen();
    //if there is collision do this, make the ball bounce on the spring with increased friction to make sure it can be shot away after not too long
    boolean hit = collideWithSpring();
    //float pballY = dist(x, y, spring.location.x, spring.location.y);
    if (hit) {
      //if (dist(x, y, x, spring.location.y) <= (radius)) {
      makeBounceBottom(spring.location.y);
      //y = spring.location.y - radius;
      //yspeed *= bounce;
      yspeed -= yspeed * springFriction;
      //y += yspeed;
      //}
    } 
    //drawing the ball
    //ellipse(x, y, diameter, diameter);
  }
}
