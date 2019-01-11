public class GameOver {
  PImage gameOverScreen;

  public void init() {
    gameOverScreen = loadImage("gameover.jpg");
  }

  public void draw() {
    background(gameOverScreen);
    text(bumploc.total, 700, 550);
    fill(0);
    text("Your score: ", 200, 550);
    text("Z = Main Menu.", 100, 700);
    text("X = Restart.", 700, 700);
  }
}
