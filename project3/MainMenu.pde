public class MainMenu {
  PImage TitleScreen1;
  PImage TitleScreen2;
  PImage TitleScreen3;
  PImage play;
  PImage score;
  PImage setting;
  PImage exit;
  PImage BackScreen1;
  //Blok[] blok = new Blok[4];
  //blok[0] = new Playb(100, 400, 150, 150); 
  //blok[1] = new scoreb(400, 400, 150, 150);
  //blok[2] = new settingb(700, 400, 150, 150);
  //blok[2] = new exitb(1000, 400, 150, 150);

  public Blok playBlok =    new Blok(100, 470, 150, 150);
  public Blok scoreBlok =   new Blok(400, 470, 150, 150);
  public Blok settingBlok = new Blok(700, 470, 150, 150);
  public Blok exitBlok =    new Blok(1000, 470, 150, 150);

  public MainMenu() {
    playBlok.state = ButtonStates.SELECTED;
    exitBlok.exitFunction = false;
  }
  public void init() {
    //  TitleScreen1 = loadImage("jazz1.png");
    //TitleScreen2 = loadImage("jazz2.png");
    //TitleScreen3 = loadImage("jazz3.png");
    BackScreen1 = loadImage("wall.jpg");
    play = loadImage("play.png");
    score = loadImage("score.png");
    setting = loadImage("setting.png");
    exit = loadImage("exit.png");
    
  }

  public void draw() {
    background(BackScreen1);
    playBlok.draw();
    scoreBlok.draw();
    settingBlok.draw();
    exitBlok.draw();
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
    //        image(TitleScreen1, 320, 50, width/2, height/2);
    //image(TitleScreen2, 330, 60, width/2, height/2);
    //image(TitleScreen3, 340, 80, width/2, height/2);
  }


  //naar rechts gaan
  public void selectNextButton() {
    if (playBlok.state == ButtonStates.SELECTED || playBlok.state == ButtonStates.PRESSED) {
      playBlok.state = ButtonStates.IDLE;
      scoreBlok.state = ButtonStates.SELECTED;
    } else if (scoreBlok.state == ButtonStates.SELECTED || scoreBlok.state == ButtonStates.PRESSED) {
      scoreBlok.state = ButtonStates.IDLE;
      settingBlok.state = ButtonStates.SELECTED;
    } else if (settingBlok.state == ButtonStates.SELECTED || settingBlok.state == ButtonStates.PRESSED) {
      settingBlok.state =  ButtonStates.IDLE;
      exitBlok.state = ButtonStates.SELECTED;
    }
  }
  //naar links gaan
  public void selectPreviousButton() {
    if (scoreBlok.state == ButtonStates.SELECTED || scoreBlok.state == ButtonStates.PRESSED) {
      scoreBlok.state = ButtonStates.IDLE;
      playBlok.state = ButtonStates.SELECTED;
    } else if (settingBlok.state == ButtonStates.SELECTED || settingBlok.state == ButtonStates.PRESSED) {
      settingBlok.state = ButtonStates.IDLE;
      scoreBlok.state = ButtonStates.SELECTED;
    } else if (exitBlok.state == ButtonStates.SELECTED || exitBlok.state == ButtonStates.PRESSED) {
      exitBlok.state = ButtonStates.IDLE;
      settingBlok.state = ButtonStates.SELECTED;
    }
  }
  //knop indrukken
  public void highlightButton() {
    if (playBlok.state == ButtonStates.SELECTED) {
      playBlok.state = ButtonStates.PRESSED;
      speel.play();
    } else if (scoreBlok.state == ButtonStates.SELECTED) {
      scoreBlok.state = ButtonStates.PRESSED;  
      others.play();
    } else if (settingBlok.state == ButtonStates.SELECTED) {
      settingBlok.state = ButtonStates.PRESSED;
      others.play();
    } else if (exitBlok.state == ButtonStates.SELECTED) {
      exitBlok.state = ButtonStates.PRESSED;
      others.play();
    }
  }
  //exitknop functie(exit)
  public void exitfunction() {
    if (exitBlok.state == ButtonStates.PRESSED) {
      exitBlok.exitFunction = true;
      highscores.save("highscore.csv");
    }
  }
  public void statusSwitch() {
    if (playBlok.state == ButtonStates.PRESSED) {
      playBlok.statusSwitch = true;
    }
  }
  public void scoreLijst() {
    if (scoreBlok.state == ButtonStates.PRESSED) {
      scoreBlok.scoreLijst = true;
    }
  }
  public void settingMenu() {
    if (settingBlok.state == ButtonStates.PRESSED) {
      settingBlok.settingsMenu = true;
    }
  }
  public void reset() {
    if (playBlok.state == ButtonStates.PRESSED) {
      playBlok.state = ButtonStates.SELECTED;
      playBlok.statusSwitch = false;
    }
  }
  public void reset1() {
    if (scoreBlok.state == ButtonStates.PRESSED) {
      scoreBlok.state = ButtonStates.SELECTED;
      scoreBlok.scoreLijst = false;
    }
  }
  public void reset2() {
    if (settingBlok.state == ButtonStates.PRESSED) {
      settingBlok.state = ButtonStates.SELECTED;
      settingBlok.settingsMenu = false;
    }
  }
}
