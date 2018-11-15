public class Flippern { //70, 135 en -10
  private float width, height; //size
  private PVector location;
  private float currentRotation;
  private final float MAX_ROTATION = radians(70);
  public ButtonStats stat = ButtonStats.IDLE;
  //constructor
  private Flippern(int x, int y, int width, int height) {  
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
    rotate(radians(135));
    //---
    switch(stat) {
    case PRESSED:
      {
        currentRotation = min(currentRotation - radians(-10), MAX_ROTATION);
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

public enum stats {
  Left, Right
}
public enum ButtonStats {
  IDLE, 
    PRESSED
}
