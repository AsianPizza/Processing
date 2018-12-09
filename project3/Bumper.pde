public class Bumper {
  private float x;
  private float y;
  private float diameter = 35;
  private float radius = diameter/2;
  //variables to use for saving the previous frame's ball.x and ball.y
  private float oldX;
  private float oldY;
  public float width, height;
  public boolean hit;
  public int total;
    public Bumper(float x, float y, float width, float height) {
   this.x = x;
   this.y = y;
    this.width = width;
    this.height = height;
  }
  //method for collision detection
  public boolean ballCollision(float c1x, float c1y, float c1r, float c2x, float c2y, float c2r) {

    float dx = c1x - c2x;
    float dy = c1y - c2y;

    float d = sqrt(sq(dx) + sq(dy));   

    if (d <= c1r + c2r) {
      return true;
      //float impactAngle = atan2(dy, dx);
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
      //calculating the right angle using the Pythagoras theorem
      float mag1 = sqrt(sq(ball.xspeed)+sq(ball.yspeed));
      ball.x = oldX + 1;
      ball.y = oldY + 1;
      ball.xspeed = (mag1*dx/d)*-ball.bounce;
      ball.yspeed = (mag1*dy/d)*-ball.bounce;
      ball.x += ball.xspeed;
      ball.y += ball.yspeed;
    } else {
      //oude x en y locatie van bal opslaan
      oldX = ball.x;
      oldY = ball.y;
    }

    // drawing the bumper
    ellipse(x, y, diameter, diameter);

    /*float peeta = sqrt(sq(ball.xspeed) + sq(ball.yspeed));
     
     ball.xspeed = (peeta * px / d)/2 * -ball.gravity;
     ball.yspeed = (peeta * py / d)/2 * ball.gravity;      
     ball.x -= ball.xspeed;
     ball.y -= ball.yspeed;*/

    /*ball.x = px;
     ball.y = py;
     
     ball.xspeed += (x + cos(impactAngle));
     ball.yspeed += (y + sin(impactAngle));    
     
     ball.x += ball.xspeed;
     ball.y += ball.yspeed;
     } else {
     px = ball.x;
     py = ball.y;
     }*/
}
}
