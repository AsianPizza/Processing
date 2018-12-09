public class Deth {
  PImage gameOverScreen;
  int x = 1280;
  int y = 720;
  
  public void init(){
  gameOverScreen = loadImage("gameover.jpg");
  }

  public void draw() {
 background(gameOverScreen);
 text("Your score: ", 200, 550);
 text("Press Z to continue.", 300, 700);
    fill(0);
  }
}
