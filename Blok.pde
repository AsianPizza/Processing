public class Blok {
 //Main menu button variables
  public PVector location;
  public int width;
  public int height;
  public boolean exitFunction;
  public ButtonStates state = ButtonStates.IDLE;
  //Button location
  public Blok(int x, int y, int width, int height) {
    location = new PVector(x, y);
    this.width = width;
    this.height = height;
  }
  //switch between states: pressed, selected and idle
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
    //quit button function
    if (exitFunction) {
      exit();
    }
    rect(location.x, location.y, width, height);

    
  }
  //enums used for the different buttons and their game states
}
public enum States {
  PLAY, MENU, OPTIONS, END
}
public enum ButtonStates {
  IDLE, 
    SELECTED, 
    PRESSED
}
