//trying to work out collision with a singular line, where the ball will bounce in the correct direction after collision

public class Lijn {
  private float x1 = 1280;
  private float y1 = 60;
  private float x2 = 1220;
  private float y2 = 0;

  public Lijn() {
  }

  boolean linePoint(float x1, float y1, float x2, float y2, float px, float py) {

    float lineLength = dist(x1, y1, x2, y2); 
    float buffer = 0.1f;

    float d1 = dist(px, py, x1, y1);
    float d2 = dist(px, py, x2, y2);

    if (d1+d2 >= lineLength-buffer && d1+d2 <= lineLength+buffer) {
      return true;
    }
    return false;
  }

  private void draw() {

    float px = ball.x + ball.radius;
    float py = ball.y + ball.radius;

    line(x1, y1, x2, y2);

    float d1 = dist(px, py, x1, y1);
    float d2 = dist(px, py, x2, y2);

    boolean hit = linePoint(x1, y1, x2, y2, px, py);

    float d  = sqrt(sq(d1 + d2) + sq(d2 + d1));

    if (hit) {
      ball.xspeed -= 1;
      float peeta = sqrt(sq(ball.xspeed) + sq(ball.yspeed));
      ball.xspeed = (peeta * px / d) * -ball.gravity;
      ball.yspeed = (peeta * py / d) * ball.gravity;
      ball.x += ball.xspeed;
      ball.y += ball.yspeed;
    }
  }
}
