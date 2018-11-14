//Constructing all classes
private final float FPS = 60;
private RotateFlipper rotateFlipper = new RotateFlipper();
public Status statu = Status.statuPause;
private MainMenu mainMenu = new MainMenu();
private Ball ball = new Ball();
private Level level = new Level();
public Spring spring = new Spring(1225, 360);
//private Lijn lijn = new Lijn();

void setup() {
  size(1280, 720);
  frameRate(FPS);
}

void draw() {
  background(255);
  // rotateFlipper.draw();
  switch (statu) {
  case statuPause:  
    {   // menu screen
      pauseStateGame();
      break;
    }
  case statuGame:  
    {   // gameplay
      playStateGame();
      break;
    }
  }
}

void keyPressed() {
  spring.keyPressed();
  if (key == 'z' ) {
    rotateFlipper.flipFlip();
  }
  if (key == 'x' ) {
    rotateFlipper.flipFlip();
  }
  if (key == CODED) {
    if (keyCode == LEFT) {
      mainMenu.selectPreviousButton();
    }
    if (keyCode == RIGHT) {
      mainMenu.selectNextButton();
    }
  }
  if (key == ' ') {
    mainMenu.highlightButton(); 
    mainMenu.exitfunction();
  }
  if (key == ' ') {
    switch (statu) {
    case statuPause:
      statu = Status.statuGame;
      break;
    case statuGame:
      statu = Status.statuPause;
      break;
    }
  }
}
void keyReleased() {  
  spring. keyReleased();
  if (key == 'z') {
    rotateFlipper.returnFlip();
  }
  if (key == 'x') {
    rotateFlipper.returnFlip();
  }
}

public enum Status {
  statuPause, 
    statuGame
}


public void playStateGame() {
  spring.draw();
  level.draw();
  //lijn.draw();
  rotateFlipper.draw();
  ball.draw();
}

public void pauseStateGame() {
  mainMenu.draw();
  strokeWeight(10);
  strokeJoin(ROUND);
}
