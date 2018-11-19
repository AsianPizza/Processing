//Constructing all classes
private final float FPS = 60;
private RotateFlipper rotateFlipper = new RotateFlipper();
public Status statu = Status.statuPause;
private MainMenu mainMenu = new MainMenu();
private Ball ball = new Ball();
private Level level = new Level();
public Spring spring = new Spring(1225, 360);
public Deth deth = new Deth();
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
  case statuDeth:
    {//game over
      dethStateGame();
      break;
    }
  }
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
  }
  //dit moet een if worden aangezien switch nu aangeeft dat ik terug kan naar mijn main menu wat natuurlijk niet mag en het is geen pauze scherm dus score vervalt dan, ik moet ook nog ervoor zorgen dat play state alleen op de eerste knop zit, nu is het allemaal
  //voeg in level een zwarte stroke toe om het state kleur switch probleem op te lossen
  if (key == ' ') {
    switch (statu) {
    case statuPause:
      statu = Status.statuGame;
      break;
    case statuGame:
      statu = Status.statuDeth;
      break;
    case statuDeth:
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
//shows the different gamestates and which classes they draw
public enum Status {
  statuPause, 
    statuGame, 
    statuDeth
}


public void playStateGame() {
  spring.draw();
  level.draw();
  lijn.draw();
  rotateFlipper.draw();
  ball.draw();
}

public void pauseStateGame() {
  mainMenu.draw();
  strokeWeight(10);
  strokeJoin(ROUND);
}

public void dethStateGame() {
  textSize(32);
  deth.draw();
}
