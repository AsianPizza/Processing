import processing.sound.*;

//lijst aan dingen die nog gedaan moeten worden: settings afmaken, game over scherm uitbreiden, scoremethode maken, ben al bezig voor 8 uur en ben toggl vergeten oof
//versie 1
//Constructing all classes
  
import processing.sound.*;
public SoundFile file;
public SoundFile dick;
public SoundFile others;
public SoundFile speel;
public SoundFile pinball;
public SoundFile bumperhit;
public SoundFile gameOver;
public SoundFile construction;
private final float FPS = 60;
private RotateFlipper rotateFlipper = new RotateFlipper();
public Status statu = Status.statuPause;
private MainMenu mainMenu = new MainMenu();
private Ball ball = new Ball();
private Level level = new Level();
public Spring spring = new Spring(1225, 360);
public Deth deth = new Deth();
public BumpLoc bumploc = new BumpLoc();
public Lijst lijst = new Lijst();
public  ScoreList highscores = new ScoreList();
private Lijn lijn = new Lijn();
public Settings settings = new Settings();
public OnScreen onScreen = new OnScreen();
//public Sounds sounds = new Sounds();
public int playerIndex = 0;
  PImage[] imagesBumper = new PImage[9];
PImage balletje;
  PImage pinballbg;
PFont font;
void setup() {
  size(1280, 720);
  frameRate(FPS);
  highscores.load("highscore.csv");
  font = createFont("crash-a-like.ttf", 32);
textFont(font);
balletje = loadImage("testball.png");
  pinballbg = loadImage("pinballbg.jpg");
  for (int i=0; i < imagesBumper.length; i++){
    imagesBumper[i] = loadImage("testbumper.png");
  }
//sounds.loadMusic("menumusic.mp3");
//  sounds.playMusic();
  file = new SoundFile(this, "menumusic.mp3");
  dick = new SoundFile(this, "menuselect.wav");
  others  = new SoundFile(this, "otherbuttons.wav");
  speel = new SoundFile(this, "playbutton.wav");
  pinball = new SoundFile(this, "pinball.mp3");
  bumperhit = new SoundFile(this, "bumperhit.wav");
  gameOver = new SoundFile(this, "gameover.wav");
  construction = new SoundFile(this, "construction.wav");
  
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
  case statuScore:
    {//score
      lijstStateGame();
      break;
    }
  case statuSetting:
    {//score
      settingStateGame();
      break;
    }
  }
  //dood, deth
  if (ball.y >715) {   
    statu = Status.statuDeth;
    ball.y = 100;
    ball.x = 1250;
    ball.xspeed = 0;
    ball.yspeed = 0;
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
    if (keyCode == LEFT && statu == Status.statuPause) {
      mainMenu.selectPreviousButton();
      dick.play(1, 1.0);
    }
    if (keyCode == RIGHT && statu == Status.statuPause) {
      mainMenu.selectNextButton();
      dick.play(1, 1.0);
    }
  }
  if (key == ' ') {
    mainMenu.highlightButton(); 
    mainMenu.exitfunction();
    mainMenu.statusSwitch();
    mainMenu.scoreLijst();
    mainMenu.settingMenu();
  }
  if (key == 'z' && statu == Status.statuDeth) {
    statu = Status.statuPause;
    mainMenu.reset();
    highscores.addScore("Player_"+playerIndex++, bumploc.total);
    bumploc.total = 0;
  }
    if (key == 'z' && statu == Status.statuScore) {
    statu = Status.statuPause;
    mainMenu.reset1();
  }
      if (key == 'z' && statu == Status.statuSetting) {
    statu = Status.statuPause;
    mainMenu.reset2();
  }
    
      //if (key == ' ') highscores.addScore("Player_"+playerIndex++, totaal));
  

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
    statuDeth, 
    statuScore, 
    statuSetting
}


public void playStateGame() {
  textSize(32);
      background(pinballbg);
  spring.draw();
  level.draw();
  lijn.draw();
  rotateFlipper.draw();
  ball.draw();
  bumploc.draw();
  onScreen.draw();
  //every bumper image has a offset of the diameter in this case it's 25 so the x and y of bumper1 -25 gives imagesbumper x and y
  image(imagesBumper[0], 625, 475, 50, 50);
  image(imagesBumper[1], 1120, 140, 50, 50);
  image(imagesBumper[2], 40, 60, 50, 50);
  image(imagesBumper[3], 70, 140, 50, 50);
  image(imagesBumper[4], 130, 80, 50, 50);
  image(imagesBumper[5], 1140, 360, 50, 50);
  image(imagesBumper[6], 965, 455, 50, 50);
  image(imagesBumper[7], 1010, 535, 50, 50);
  image(imagesBumper[8], 915, 525, 50, 50);
  //ball.init();
  image(balletje, ball.x-22, ball.y-22, 44, 44);
    if(file.isPlaying()){ 
  file.stop();
}
  if(!pinball.isPlaying()){ 
  pinball.play();
}
}

public void pauseStateGame() {
  textSize(150);
  mainMenu.init();
  mainMenu.draw();
  strokeWeight(10);
  strokeJoin(ROUND);
  if(!file.isPlaying()){ 
  file.play();
}
}

public void dethStateGame() {
  textSize(75);
  deth.init();
  deth.draw();
   text(bumploc.total, 700, 550);
       if(file.isPlaying()){ 
  file.stop();
}
  if(!gameOver.isPlaying()){ 
  gameOver.play();
}
  if(pinball.isPlaying()){ 
  pinball.stop();
}
}
public void lijstStateGame() {
  textSize(20);
  lijst.init();
  lijst.draw();
  textSize(50);
  text("Press Z to go back.", 100, 400);
}

public void settingStateGame() {
  textSize(75);
  strokeWeight(0.5);
  strokeJoin(MITER);
  settings.init();
  settings.draw();
  text("Press Z to go back.", 350, 600);
      if(file.isPlaying()){ 
  file.stop();
}
  if(!construction.isPlaying()){ 
  construction.play();
}
}
