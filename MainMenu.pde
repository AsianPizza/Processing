public class MainMenu {
  //Blok[] blok = new Blok[4]; zoek op aankomend zondag of vraag na op maandag. ik(patrick) en fix de overlopende stroke BS naar een andere status
  private Blok playBlok =    new Blok(100, 400, 150, 150);
  private Blok scoreBlok =   new Blok(400, 400, 150, 150);
  private Blok settingBlok = new Blok(700, 400, 150, 150);
  private Blok exitBlok =    new Blok(1000, 400, 150, 150);

  public MainMenu() {
    playBlok.state = ButtonStates.SELECTED;
    exitBlok.exitFunction = false;
  }

  public void draw() {
    playBlok.draw();
    scoreBlok.draw();
    settingBlok.draw();
    exitBlok.draw();
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
    } else if (scoreBlok.state == ButtonStates.SELECTED) {
      scoreBlok.state = ButtonStates.PRESSED;
    } else if (settingBlok.state == ButtonStates.SELECTED) {
      settingBlok.state = ButtonStates.PRESSED;
    } else if (exitBlok.state == ButtonStates.SELECTED) {
      exitBlok.state = ButtonStates.PRESSED;
    }
  }
  //exitknop functie(exit)
  public void exitfunction() {
    if (exitBlok.state == ButtonStates.PRESSED) {
      exitBlok.exitFunction = true;
    }
  }
}
