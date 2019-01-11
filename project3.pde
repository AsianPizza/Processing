//INSTALL THE CONTROLP5 AND SOUND LIBRARIES IN ORDER FOR THE PROJECT TO WORK
import processing.sound.*;
//set all loading in one class, set all isplaying code in a class or method AND proper bumper locations
public SoundFile mainMenuTheme;
public SoundFile selectSound;
public SoundFile settingsBg;
public SoundFile pressedSound;
public SoundFile pinballTheme;
public SoundFile bumperHitSound;
public SoundFile gameOverSound;
public SoundFile constructionSound;
public ParticleSystem bumperHitParticle;
private final float FPS = 60;

//private RotateFlipper rotateFlipper = new RotateFlipper();
final int KEY_LIMIT = 1024;
boolean[] keysPressed = new boolean[KEY_LIMIT];
public Status statu = Status.STATUPAUSE;
private Paddle paddle = new Paddle();
private MainMenu mainMenu = new MainMenu();
private Ball ball = new Ball();
private Level level1 = new Level(0, 720, 0, 380, 380, 720);
private Level level2 = new Level(1220, 720, 1220, 380, 840, 720);
public Spring spring = new Spring(1225, 360);
public GameOver gameOverScreen = new GameOver();
public BumpLoc bumploc = new BumpLoc();
public List list = new List();
public  ScoreList highscores = new ScoreList();
private Line line = new Line();
public Settings settings = new Settings();

public int playerIndex = 0;
PImage bumperImg;
PImage ballImg;
PImage pinballbg;
PFont ingameFont;

//------------------------------------------------------------------------------------------------------------------------------------------------\\

void setup() {
  size(1280, 720);
  frameRate(FPS);
  bumploc.init();
  highscores.load("highscore.csv");
  ingameFont = createFont("crash-a-like.ttf", 32);
  textFont(ingameFont);
  ballImg = loadImage("testball.png");
  pinballbg = loadImage("pinballbg.jpg");
  bumperImg = loadImage("testbumper.png");

  mainMenuTheme = new SoundFile(this, "menumusic.mp3");
  selectSound = new SoundFile(this, "menuselect.wav");
  settingsBg  = new SoundFile(this, "otherbuttons.wav");
  pressedSound = new SoundFile(this, "playbutton.wav");
  pinballTheme = new SoundFile(this, "pinball.mp3");
  bumperHitSound = new SoundFile(this, "bumperhit.wav");
  gameOverSound = new SoundFile(this, "gameover.wav");
  constructionSound = new SoundFile(this, "construction.wav");
}

//defining gamestates using enums
void draw() {
  background(255);
  switch (statu) {
  case STATUPAUSE:  
    {   // menu screen
      pauseStateGame();
      break;
    }
  case STATUGAME:  
    {   // gameplay
      playStateGame();
      break;
    }
  case STATUDETH:
    {//game over
      dethStateGame();
      break;
    }
  case STATUSCORE:
    {//score
      lijstStateGame();
      break;
    }
  case STATUSETTING:
    {//score
      settingStateGame();
      break;
    }
  }
  //dood, deth
  if (ball.y >715) {   
    statu = Status.STATUDETH;
    ball.y = 100;
    ball.x = 1250;
  }
}
//defining functions for specific keys
void keyPressed() {
  //If a key within KEY_LIMIT is pressed and it's keyCode does not exceed the limit set it to true
  if (keyCode >= KEY_LIMIT) return;
  keysPressed[keyCode] = true;

  spring.keyPressed();
  if (key == 'z' ) {
    //rotateFlipper.flipFlip();
  }
  if (key == 'x' ) {
    //rotateFlipper.flipFlip();
  }
  if (key == CODED) {
    if (keyCode == LEFT && statu == Status.STATUPAUSE) {
      mainMenu.selectPreviousButton();
      selectSound.play(1, 1.0);
    }
    if (keyCode == RIGHT && statu == Status.STATUPAUSE) {
      mainMenu.selectNextButton();
      selectSound.play(1, 1.0);
    }
  }
  if (key == ' ') {
    mainMenu.highlightButton(); 
    mainMenu.exitfunction();
    mainMenu.statusSwitch();
    mainMenu.scoreLijst();
    mainMenu.settingMenu();
  }
  if (key == 'z' && statu == Status.STATUDETH) {
    statu = Status.STATUPAUSE;
    mainMenu.reset();
    highscores.addScore("Player_"+playerIndex++, bumploc.total);
    bumploc.total = 0;
  }
  if (key == 'z' && statu == Status.STATUSCORE) {
    statu = Status.STATUPAUSE;
    mainMenu.reset1();
  }
  if (key == 'z' && statu == Status.STATUSETTING) {
    statu = Status.STATUPAUSE;
    mainMenu.reset2();
  }
  if (key == 'x' && statu == Status.STATUDETH) {
    statu = Status.STATUGAME;
    mainMenu.reset();
    highscores.addScore("Player_"+playerIndex++, bumploc.total);
    bumploc.total = 0;
  }
}

void keyReleased() {  
  //If a key within KEY_LIMIT is released and it's keyCode does not exceed the limit set it to false, making sure the paddle stops moving after the key is released
  if (keyCode >= KEY_LIMIT) return;
  keysPressed[keyCode] = false;

  spring.keyReleased();
  if (key == 'z') {
    //rotateFlipper.returnFlip();
  }
  if (key == 'x') {
    //rotateFlipper.returnFlip();
  }
}

//shows the different gamestates and which classes they draw
public enum Status {
  STATUPAUSE, 
    STATUGAME, 
    STATUDETH, 
    STATUSCORE, 
    STATUSETTING
}


public void playStateGame() {
  textSize(32);
  background(pinballbg);
  spring.draw();
  paddle.draw();
  line.draw();
  strokeWeight(10);
  //bumploc.draw();
  level1.draw();
  level2.draw();
  //rotateFlipper.draw();
  ball.draw();
  //every bumper image has a offset of the diameter in this case it's 25 so the x and y of bumper1 -25 gives imagesbumper x and y


  image(ballImg, ball.x-22, ball.y-22, 44, 44);
  if (mainMenuTheme.isPlaying()) { 
    mainMenuTheme.stop();
  }
  if (!pinballTheme.isPlaying()) { 
    pinballTheme.play();
  }
}

public void pauseStateGame() {
  textSize(150);
  mainMenu.init();
  mainMenu.draw();
  strokeWeight(10);
  strokeJoin(ROUND);
  if (!mainMenuTheme.isPlaying()) { 
    mainMenuTheme.play();
  }
  if (constructionSound.isPlaying()) { 
    constructionSound.stop();
  }
}

public void dethStateGame() {
  textSize(75);
  gameOverScreen.init();
  gameOverScreen.draw();
  if (mainMenuTheme.isPlaying()) { 
    mainMenuTheme.stop();
  }
  if (!gameOverSound.isPlaying()) { 
    gameOverSound.play();
  }
  if (pinballTheme.isPlaying()) { 
    pinballTheme.stop();
  }
}
public void lijstStateGame() {
  textSize(20);
  list.init();
  list.draw();
  textSize(50);
  text("Press Z to go back.", 100, 400);
}

public void settingStateGame() {
  textSize(75);
  settings.init();
  settings.draw();
  text("Press Z to go back.", 350, 600);
  if (mainMenuTheme.isPlaying()) { 
    mainMenuTheme.stop();
  }
  if (!constructionSound.isPlaying()) { 
    constructionSound.play();
  }
}
