public class Bumper {
  private float x = 650;
  private float y = 500;
  private float diameter = 35;
  private float radius = diameter/2;
  private float px, py;

  private boolean ballCollision(float c1x, float c1y, float c1r, float c2x, float c2y, float c2r) {

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
    
    ellipse(x, y, diameter, diameter);

    //px = ball.x + ball.radius; 
    //py = ball.y + ball.radius;
    boolean hit = ballCollision(ball.x, ball.y, ball.radius, x, y, radius);
    
    

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
