public class MainMenu {
  PImage titleScreen1;
  PImage titleScreen2;
  PImage titleScreen3;
  PImage play;
  PImage score;
  PImage setting;
  PImage exit;
  PImage backGround;
  //Blok[] blok = new Blok[4];
  //blok[0] = new Playb(100, 400, 150, 150); 
  //blok[1] = new scoreb(400, 400, 150, 150);
  //blok[2] = new settingb(700, 400, 150, 150);
  //blok[2] = new exitb(1000, 400, 150, 150);

  public Block playBlock =    new Block(100, 470, 150, 150);
  public Block scoreBlock =   new Block(400, 470, 150, 150);
  public Block settingBlock = new Block(700, 470, 150, 150);
  public Block exitBlock =    new Block(1000, 470, 150, 150);

  public MainMenu() {
    playBlock.state = ButtonStates.SELECTED;
    exitBlock.exitFunction = false;
  }
  public void init() {
    backGround = loadImage("wall.jpg");
    play = loadImage("play.png");
    score = loadImage("score.png");
    setting = loadImage("setting.png");
    exit = loadImage("exit.png");
  }

  public void draw() {
    background(backGround);
    playBlock.draw();
    scoreBlock.draw();
    settingBlock.draw();
    exitBlock.draw();
    fill(0);
    text("Totally", 440, 160);
    text("Rad", 540, 280);
    fill(255);
    text("Totally", 420, 120);
    text("Rad", 520, 240);
    image(play, 130, 495);
    image(score, 430, 495);
    image(setting, 727, 495);
    image(exit, 1025, 495);
  }


  //naar rechts gaan
  public void selectNextButton() {
    if (playBlock.state == ButtonStates.SELECTED || playBlock.state == ButtonStates.PRESSED) {
      playBlock.state = ButtonStates.IDLE;
      scoreBlock.state = ButtonStates.SELECTED;
    } else if (scoreBlock.state == ButtonStates.SELECTED || scoreBlock.state == ButtonStates.PRESSED) {
      scoreBlock.state = ButtonStates.IDLE;
      settingBlock.state = ButtonStates.SELECTED;
    } else if (settingBlock.state == ButtonStates.SELECTED || settingBlock.state == ButtonStates.PRESSED) {
      settingBlock.state =  ButtonStates.IDLE;
      exitBlock.state = ButtonStates.SELECTED;
    }
  }
  //naar links gaan
  public void selectPreviousButton() {
    if (scoreBlock.state == ButtonStates.SELECTED || scoreBlock.state == ButtonStates.PRESSED) {
      scoreBlock.state = ButtonStates.IDLE;
      playBlock.state = ButtonStates.SELECTED;
    } else if (settingBlock.state == ButtonStates.SELECTED || settingBlock.state == ButtonStates.PRESSED) {
      settingBlock.state = ButtonStates.IDLE;
      scoreBlock.state = ButtonStates.SELECTED;
    } else if (exitBlock.state == ButtonStates.SELECTED || exitBlock.state == ButtonStates.PRESSED) {
      exitBlock.state = ButtonStates.IDLE;
      settingBlock.state = ButtonStates.SELECTED;
    }
  }
  //knop indrukken
  public void highlightButton() {
    if (playBlock.state == ButtonStates.SELECTED) {
      playBlock.state = ButtonStates.PRESSED;
      pressedSound.play();
    } else if (scoreBlock.state == ButtonStates.SELECTED) {
      scoreBlock.state = ButtonStates.PRESSED;  
      settingsBg.play();
    } else if (settingBlock.state == ButtonStates.SELECTED) {
      settingBlock.state = ButtonStates.PRESSED;
      settingsBg.play();
    } else if (exitBlock.state == ButtonStates.SELECTED) {
      exitBlock.state = ButtonStates.PRESSED;
      settingsBg.play();
    }
  }
  //exitknop functie(exit)
  public void exitfunction() {
    if (exitBlock.state == ButtonStates.PRESSED) {
      exitBlock.exitFunction = true;
      highscores.save("highscore.csv");
    }
  }
  public void statusSwitch() {
    if (playBlock.state == ButtonStates.PRESSED) {
      playBlock.statusSwitch = true;
    }
  }
  public void scoreLijst() {
    if (scoreBlock.state == ButtonStates.PRESSED) {
      scoreBlock.scoreList = true;
    }
  }
  public void settingMenu() {
    if (settingBlock.state == ButtonStates.PRESSED) {
      settingBlock.settingsMenu = true;
    }
  }
  public void reset() {
    if (playBlock.state == ButtonStates.PRESSED) {
      playBlock.state = ButtonStates.SELECTED;
      playBlock.statusSwitch = false;
    }
  }
  public void reset1() {
    if (scoreBlock.state == ButtonStates.PRESSED) {
      scoreBlock.state = ButtonStates.SELECTED;
      scoreBlock.scoreList = false;
    }
  }
  public void reset2() {
    if (settingBlock.state == ButtonStates.PRESSED) {
      settingBlock.state = ButtonStates.SELECTED;
      settingBlock.settingsMenu = false;
    }
  }
}
