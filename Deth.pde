public class Deth {
  PImage gameOverScreen;
  int x = 1280;
  int y = 720;
  
  public void init(){
  gameOverScreen = loadImage("gameover.jpg");
  }

  public void draw() {
 background(gameOverScreen);
 fill(0);
 text("Your score: ", 200, 550);
 text("Z = Main Menu.", 100, 700);
 text("X = Restart.", 700, 700);
  }
}
