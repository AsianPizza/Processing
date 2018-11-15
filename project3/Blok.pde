public class Blok {
  public PVector location;
  public int width;
  public int height;
  public boolean exitFunction;
  public ButtonStates state = ButtonStates.IDLE;

  public Blok(int x, int y, int width, int height) {
    location = new PVector(x, y);
    this.width = width;
    this.height = height;
  }

  public void draw() {
    switch(state) {
    case IDLE: 
      {
        fill(0, 0, 255);
        break;
      }
    case SELECTED: 
      {
        fill(255, 0, 0);
        break;
      }
    case PRESSED:
      {
        fill(255, 0, 0);
        stroke(0, 255, 0);
        break;
      }
    }

    if (exitFunction) {
      exit();
    }
    rect(location.x, location.y, width, height);

    
  }
}
public enum States {
  PLAY, MENU, OPTIONS, END
}
public enum ButtonStates {
  IDLE, 
    SELECTED, 
    PRESSED
}
