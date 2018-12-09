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

  if (ball.x + ball.radius >= x &&
    ball.x - ball.radius <= x + this.width &&
    ball.y + ball.radius >= y &&
    ball.y + ball.radius <= y + this.height)
  {
    System.out.println("hit");
    float rotateQrt = 15;
    float dr = maxRotation - rotation;
    if (dr >= maxRotation && dr <= maxRotation + rotateQrt) {
      ball.xspeed += 1;
      ball.yspeed += 1;
    } else if (dr >= maxRotation + rotateQrt && dr <= maxRotation + (rotateQrt * 2)) {
      ball.xspeed += 10;
      ball.yspeed += 10;
    } else if (dr >= maxRotation + (rotateQrt * 2)&& dr <= maxRotation + (rotateQrt * 3)) {
      ball.xspeed += 12;
      ball.yspeed += 12;
    } else if (dr >= maxRotation + (rotateQrt * 3)&& dr <= maxRotation + (rotateQrt * 4)) {
      ball.xspeed += 14;
      ball.yspeed += 14;
    }
    ball.y = y;
    ball.xspeed *= ball.bounce;
    ball.yspeed *= ball.bounce;
  }
}
