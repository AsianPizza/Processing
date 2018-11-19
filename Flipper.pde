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
