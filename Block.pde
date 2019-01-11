public class Block {
  //Main menu button variables
  public PVector location;
  public int width;
  public int height;
  public boolean exitFunction;
  public boolean statusSwitch;
  public boolean scoreList;
  public boolean settingsMenu;
  public ButtonStates state = ButtonStates.IDLE;
  //Button location
  public Block(int x, int y, int width, int height) {
    location = new PVector(x, y);
    this.width = width;
    this.height = height;
  }
  //switch between states: pressed, selected and idle
  public void draw() {
    switch(state) {
    case IDLE: 
      {
        stroke(0);
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
      mainMenuTheme.stop();

      exit();
      //if it doesn't work then just reset the .csv since that seems to be the issue
    }
    //game button function
    if (statusSwitch) {
      statu = Status.STATUGAME;
    }
    if (scoreList) {
      statu = Status.STATUSCORE;
    }
    if (settingsMenu) {
      statu = Status.STATUSETTING;
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
