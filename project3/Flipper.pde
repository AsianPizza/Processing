public class Flipper { //-60, 35, 10
  private float width, height; //size
  private PVector location;
  private float currentRotation;

  private final float MAX_ROTATION = radians(-60);
  public ButtonStatbs statb = ButtonStatbs.IDLE;
  //constructor
  private Flipper(int x, int y, int width, int height) {  
    location = new PVector(x, y);
    this.width = width;
    this.height = height;
    currentRotation = 0;
    //locatie + hoogte/breedte
  }
  //----------------------------------------------
  void update() {
  }

  public void draw () {
    
    Collision(location.x, location.y, currentRotation, MAX_ROTATION);


    pushMatrix();

    translate (location.x, location.y);
    //start rotatie
    rotate(radians(35));
    //---
    switch(statb) {
    case PRESSED:
      {
        currentRotation = max(currentRotation - radians(10), MAX_ROTATION);
        println ("currentrotation" + currentRotation);
        rotate(currentRotation);
        break;
      }  
    case IDLE:
      {
        currentRotation = 0;
        break;
      }
    }
    fill(255, 0, 255);
    rect(0, 0, width, height);
    popMatrix();
  }
}

public enum Statbs {
  Left, Right
}
public enum ButtonStatbs {
  IDLE, 
    PRESSED
}

public void Collision(float x, float y, float rotation, float maxRotation) {
  //very simple rectangle collision detection and making sure it only detects collision if the ball is no longer in the shooting column
  if (ball.x + ball.radius >= x &&
    ball.x - ball.radius <= x + this.width &&
    ball.y + ball.radius >= y &&
    ball.y + ball.radius <= y + this.height &&
    ball.x < width - 60)
  {
    System.out.println("hit");
    //Giving the ball set speeds based on the flippers' current rotation
    float rotateQrt = radians(15);
    float dr = maxRotation - rotation;
    if (dr >= maxRotation && dr <= maxRotation + rotateQrt) {
      ball.xspeed += 1;
      ball.yspeed += 1;
      System.out.println("current"+radians(dr));
    } else if (dr >= maxRotation + rotateQrt && dr <= maxRotation + (rotateQrt * 2)) {
      ball.xspeed += 10;
      ball.yspeed += 10;
      System.out.println("current"+radians(dr));
    } else if (dr >= maxRotation + (rotateQrt * 2)&& dr <= maxRotation + (rotateQrt * 3)) {
      ball.xspeed += 12;
      ball.yspeed += 12;
      System.out.println("current"+radians(dr));
    } else if (dr >= maxRotation + (rotateQrt * 3)&& dr <= maxRotation + (rotateQrt * 4)) {
      ball.xspeed += 14;
      ball.yspeed += 14;
      System.out.println("current"+radians(dr));
    }
    ball.y = y;
    ball.xspeed *= ball.bounce;
    ball.yspeed *= ball.bounce;
  }
}  
