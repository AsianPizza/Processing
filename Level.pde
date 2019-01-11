class Level {

  public float x = 0; //To be used for the x1 and x2 in the triangle to determine the x coordinates
  public float y = 720; //To be used for the y1 and y3 to determine the y coordinates of the triangle
  private float oldXspeed;
  private float oldYspeed;
  private float x1;
  private float y1; 
  private float x2;
  private float y2; 
  private float x3; 
  private float y3;
  public float size = 380; //To be used for the y2 and x3 in the triangle named equal as these are the equal sides of the triangle



  public Level(float x1, float y1, float x2, float y2, float x3, float y3) {
    this.x1 = x1;
    this.y1 = y1;
    this.x2 = x2;
    this.y2 = y2;
    this.x3 = x3;
    this.y3 = y3;
  }

  private void draw() {
    fill(255, 0, 0);
    if (ball.x <= 380) {
      //System.out.println("in left square ");
      leftCorner(size);
    } else if (ball.x >= 840) {
      //System.out.println("in right square ");
      rightCorner(size);
    }
    triangle(x1, y1, x2, y2, x3, y3);
  }

  public boolean inSquare(float x1, float x3) {
    noFill();
    noStroke();
    rect(x1, x3, x3, x3);
    stroke(1);
    fill(255);
    if ((ball.x + ball.radius > x1) &&
      (ball.x - ball.radius < x1 + x3) &&
      (ball.y > height - x3)) {
      //System.out.println("in a square ");
      return true;
    } else
      return false;
  }

  public void leftCorner(float size) {
    float middle = size/2;
    float dx = middle - (ball.x);
    float dy = (height - middle) - (ball.y + ball.radius);
    //System.out.println(dx + " " + dy);

    if (inSquare(x1, x3) && dx >= dy && ball.y + ball.radius <= (height - middle) && ball.x - ball.radius <= middle) {

      bounceLeft();

      //ball.y += -ball.yspeed;
      //ball.x += ball.xspeed;
    } else {
      oldXspeed = ball.xspeed;
      oldYspeed = ball.yspeed;
    }

    if (inSquare(x1, x3) && dx >= dy && ball.y + ball.radius >= (height - middle) && ball.x + ball.radius >= middle) {

      bounceLeft();

      //ball.y += -ball.yspeed;
      //ball.x += ball.xspeed;
    } else {
      oldXspeed = ball.xspeed;
      oldYspeed = ball.yspeed;
    }
  }

  public void rightCorner(float size) {
    float middle = size/2;
    float dx = (1220 - middle) - ball.x;
    float dy = (height - middle) - (ball.y + ball.radius);
    System.out.println(dx * -1 + " " + dy + " " + inSquare(840, 380));

    if (inSquare(840, 380) && dy * -1 >= dx && ball.y + ball.radius >= (height - middle) && ball.x + ball.radius <= x1 - middle) {
      System.out.println("hit "+ dx + " " + dy * -1);

      bounceRight();   

      //ball.y += -ball.yspeed;
      //ball.x += ball.xspeed;
      //System.out.println(ball.xspeed);
    } else {
      oldXspeed = ball.xspeed;
      oldYspeed = ball.yspeed;
    }

    if (inSquare(840, 380) && dx * -1 >= dy && ball.y + ball.radius <= (height - middle) && ball.x - ball.radius >= x1 - middle) {
      System.out.println("hit "+ dx * -1 + " " + dy);

      bounceRight();  


      //ball.y += -ball.yspeed;
      //ball.x += ball.xspeed;
    } else {
      oldXspeed = ball.xspeed;
      oldYspeed = ball.yspeed;
    }
  }
  void bounceLeft() {
    //return to old pos
    ball.y -= ball.yspeed;
    ball.x -= ball.xspeed;
    
    ball.xspeed = oldXspeed;
    ball.yspeed = oldYspeed;      
    //ball.xspeed *= ball.bounce;
    //ball.yspeed *= ball.bounce;
    ball.yspeed = oldXspeed;
    ball.xspeed = oldYspeed;
  }
  void bounceRight() {
    //return to old pos
    ball.y -= ball.yspeed;
    ball.x -= ball.xspeed;
    
    
    ball.xspeed = oldXspeed;
    ball.yspeed = oldYspeed;
    //ball.xspeed *= ball.bounce;
    //ball.yspeed *= ball.bounce;
    ball.xspeed = -oldYspeed;
    ball.yspeed = -oldXspeed;
  }
}
