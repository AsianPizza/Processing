public class Level {
  //preventing some magic numbers and saving myself some typing
  public float third = 1f/3f;
  public float twothirds = 2f/3f;
  public float x1, y1, x2, y2;
  //making the sure the ball doesn't stay still on one of the rectangles
  private float returnToMiddle = 0.5;

  public Level() {
  }

  private void draw() {
    //drawing general outlining of the level
    noFill();
    line(0, 0, width, 0);
    line(0, 0, 0, height);    
    line(0, height - 1, (width * third) + 100, height - 1);
    line(width, height - 1, (width * twothirds) - 100, height - 1);
    line(width, 0, width - 1, height);
    line(width - 60, 100, width - 60, height);
    //line(width, 60, width - 60, 0);    

    //Drawing rectangles to use for the level, and giving them x, y, width and height values so as to make it easier to write the collision for each rectangle
    float r1x = 0;
    float r1y = height/2 - 80;
    float r1w = (width * third) + 100;
    float r1h = 80;
    rect(r1x, r1y, r1w, r1h);
    //Basic collision for all rectangles
    if (ball.x + ball.radius >= r1x &&
      ball.x - ball.radius <= r1x + r1w &&
      ball.y >= r1y  - ball.radius  &&
      ball.y  + ball.radius <= r1y + r1h)
    {
      ball.xspeed += returnToMiddle;
      ball.x += ball.xspeed;
      ball.yspeed *= ball.bounce;
      ball.yspeed *= ball.gravity;
      ball.y += ball.yspeed;
    }
    //collision for the sides of the rectangles
    if (ball.x - ball.radius <= r1x + r1w &&
      ball.y >= r1y  - ball.radius  &&
      ball.y  + ball.radius<= r1y + r1h) 
    {
      ball.xspeed *= ball.bounce;
      ball.x += ball.xspeed;      
    }

    float r2x = (width * twothirds) - 100;
    float r2y = height/2 - 80;
    float r2w= 466;
    float r2h = 80;
    rect(r2x, r2y, r2w, r2h);
    if (ball.x + ball.radius >= r2x &&
      ball.x - ball.radius <= r2x + r2w &&
      ball.y + ball.radius >= r2y &&
      ball.y + ball.radius <= r2y + r2h)
    {
      ball.xspeed -= returnToMiddle;
      ball.x += ball.xspeed;
      ball.yspeed *= ball.bounce;
      ball.yspeed *= ball.gravity;
      ball.y += ball.yspeed;
    }
    //collision for the sides of the rectangles
    if (ball.x + ball.radius >= r2x &&
      ball.y >= r2y  - ball.radius  &&
      ball.y + ball.radius <= r2y + r2h) 
    {
      ball.xspeed *= ball.bounce;
      ball.x += ball.xspeed;      
    }

    float r3x = 0;
    float r3y = height- 80;
    float r3w= (width * third) + 100;
    float r3h = 80;
    rect(r3x, r3y, r3w, r3h);
    if (ball.x + ball.radius >= r3x &&
      ball.x - ball.radius <= r3x + r3w &&
      ball.y + ball.radius >= r3y &&
      ball.y + ball.radius <= r3y + r3h)
    {
      ball.xspeed += returnToMiddle;
      ball.x += ball.xspeed;
      ball.yspeed *= ball.bounce;
      ball.yspeed *= ball.gravity;
      ball.y += ball.yspeed;
    }
    //collision for the sides of the rectangles
    if (ball.x - ball.radius <= r3x + r3w &&
      ball.y >= r3y  - ball.radius  &&
      ball.y +  ball.radius <= r3y + r3h) 
    {
      ball.xspeed *= ball.bounce;
      ball.x += ball.xspeed;      
    }

    float r4x = (width * twothirds) - 100;
    float r4y = height- 80;
    float r4w= 466;
    float r4h = 80;
    rect(r4x, r4y, r4w, r4h);
    if (ball.x + ball.radius >= r4x &&
      ball.x - ball.radius <= r4x + r4w &&
      ball.y + ball.radius >= r4y &&
      ball.y + ball.radius <= r4y + r4h)
    {
      ball.xspeed -= returnToMiddle;
      ball.x += ball.xspeed;
      ball.yspeed *= ball.bounce;
      ball.yspeed *= ball.gravity;
      ball.y += ball.yspeed;
    }
    //collision for the sides of the rectangles
    if (ball.x + ball.radius >= r4x &&
      ball.y >= r4y  - ball.radius  &&
      ball.y + ball.radius <= r4y + r4h) 
    {
      ball.xspeed *= ball.bounce;
      ball.x += ball.xspeed;      
    }
    //temporary indicators for the bumper location, to be replaced with actual bumper classes
    //Bumper locations
    fill(255, 0, 255);
    //Top right in curve
    ellipse(1145, 165, 35, 35);
    //top left corner
    ellipse(65, 85, 35, 35);
    ellipse(95, 165, 35, 35);
    ellipse(155, 105, 35, 35);
    //bottom right corner
    ellipse(1165, 385, 35, 35);
    ellipse(990, 480, 35, 35);
    ellipse(1035, 560, 35, 35);
    ellipse(940, 550, 35, 35);
  }
}
