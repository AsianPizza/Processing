//Constructing all classes
private final float FPS = 60;
private RotateFlipper rotateFlipper = new RotateFlipper();
public Status statu = Status.statuPause;
private MainMenu mainMenu = new MainMenu();
private Ball ball = new Ball();
private Level level = new Level();
public Spring spring = new Spring(1225, 360);
public Deth deth = new Deth();
public Bumper bumper = new Bumper();
public Lijst lijst = new Lijst();
private Lijn lijn = new Lijn();

void setup() {
  size(1280, 720);
  frameRate(FPS);
}

//defining gamestates using enums
void draw() {
  background(255);
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
  //case statuDeth:
    //{//game over
      //dethStateGame();
      //break;
    //}
    case statuScore:
    {//score
      lijstStateGame();
    }
  }
  //dood, deth
  //if(ball.y >715) {   
    //statu = Status.statuDeth;
//}
}
//defining functions for specific keys
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
    mainMenu.statusSwitch();
    mainMenu.scoreLijst();
  }
  //eerste versie van de state switch voor het testen
  //if (key == ' ') {
  //  switch (statu) {
  //  case statuPause:
  //    statu = Status.statuGame;
  //    break;
  //  case statuDeth:
  //    statu = Status.statuPause;
  //    break;
  //  }
  //}
}

void keyReleased() {  
  spring.keyReleased();
  if (key == 'z') {
    rotateFlipper.returnFlip();
  }
  if (key == 'x') {
    rotateFlipper.returnFlip();
  }
}
//shows the different gamestates and which classes they draw
public enum Status {
  statuPause, 
    statuGame, 
    //statuDeth,
    statuScore
}


public void playStateGame() {
  spring.draw();
  level.draw();
  lijn.draw();
  rotateFlipper.draw();
  ball.draw();
  bumper.draw();
}

public void pauseStateGame() {
  mainMenu.draw();
  strokeWeight(10);
  strokeJoin(ROUND);
}

public void dethStateGame() {
  textSize(32);
  //deth.draw();
}
public void lijstStateGame(){
textSize(20);
lijst.draw();
}
