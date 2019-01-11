public class Bumper {
  private float x;
  private float y;
  private float diameter = 35;
  private float radius = diameter/2;
  //variables to use for saving the previous frame's ball.x and ball.y
  private float oldX;
  private float oldY;
  public  float w, h;
  public  boolean hit;

  public Bumper(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }

  //method for collision detection
  public boolean ballCollision(float c1x, float c1y, float c1r, float c2x, float c2y, float c2r) {

    float dx = c1x - c2x;
    float dy = c1y - c2y;

    float d = sqrt(sq(dx) + sq(dy));   

    if (d <= c1r + c2r) {
      return true;
    }
    return false;
  }




  public void draw() {
    fill(0, 255, 0);

    float dx = ball.x - x;
    float dy = ball.y - y;    
    float d = sqrt(sq(dx) + sq(dy));

    hit = ballCollision(ball.x, ball.y, ball.radius, x, y, radius);

    //giving the ball the right xspeed and yspeed based on the angle
    if (hit) {

      bumploc.total += 100;
      bumperHitSound.play();
      bumperHitParticle.x0 = ball.x;
      bumperHitParticle.y0 = ball.y;
      bumperHitParticle.emit(50);
      //calculating the right angle using the Pythagoras theorem
      float mag1 = sqrt(sq(ball.xspeed)+sq(ball.yspeed));
      ball.x = oldX;
      ball.y = oldY;
      ball.xspeed = (mag1*dx/d)*-ball.bounce;
      ball.yspeed = (mag1*dy/d)*-ball.bounce;
      ball.x += ball.xspeed;
      ball.y += ball.yspeed;
    } else {
      //Saving the old x and y location of the ball in these variables
      oldX = ball.x;
      oldY = ball.y;
    }

    // drawing the bumper
    image(bumperImg, x-25, y-25, 50, 50);
  }
}
