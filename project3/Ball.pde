public class Ball {
  //setting up some variables to use for the ball
  public float gravity = 0.98f;
  public final float bounce = -1;
  public float yspeed = 0;
  public float xspeed = 0;

  public int diameter = 30;
  public int radius = diameter/2;
  public float x = 1250;
  public float y = 100 + radius;
  public float friction = 0.1;
  public Ball() {
  }

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




  private void draw() {
    strokeWeight(5);
    //Giving the ball gravity and base speed values
    yspeed += gravity;
    y += yspeed;
    x += xspeed;
    //if there is collision do this, make ball bounce on the spring
    boolean hit = collideWithSpring();
    float pballY = dist(x, y, spring.location.x, spring.location.y);
    if (hit) {
      //if (dist(x, y, x, spring.location.y) <= (radius)) {
      yspeed *= bounce;
      yspeed -= yspeed * friction;
      y += yspeed;
      //}
    } else if (hit && !spring.shoot) {
      yspeed += 5;
      yspeed *= bounce;
      yspeed -= yspeed * friction;
      y += yspeed;      
    }


    ellipse(x, y, diameter, diameter);
    //collision with walls, to keep the ball inside the level
    if (x > width - radius || x < 0 + radius || x > width - 60 - radius) {
      xspeed *= bounce;
      xspeed -= xspeed * friction;
      x += xspeed;
    } 
    if (y > height - radius || y < 0 + radius) {
      y = height - radius;
      yspeed *= bounce;
      yspeed -= yspeed * friction;
      y += yspeed;
    }
  }
}
