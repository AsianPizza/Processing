public class Settings {
  PImage underConstruction;
  //settings for the mainmenu, change ball, timer invoeren(modus), change gravity, change theme en reset scores
  //making it a bunch of simple switches and not using anything fancy like using buttonpresses with simple text overlays is a possibility

  public void init() {
    underConstruction = loadImage("under construction.jpg");
  }

  public void draw() {
    fill(255);
    background(underConstruction);
  }
}
