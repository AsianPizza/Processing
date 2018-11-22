public class RotateFlipper {
  private Flipper leftFlipper = new Flipper(560, 640, 60, 15);
  private Flippern rightFlipper = new Flippern(730, 650, 55, 15);
//de stand aanroepen van de flippers met enums
  public RotateFlipper() {
    leftFlipper.statb = ButtonStatbs.IDLE;
    rightFlipper.stat = ButtonStats.IDLE;
  }
//flippers laten verschijnen
  public void draw() {
    leftFlipper.draw();
    rightFlipper.draw();
  }

  public void flipFlip() {
    if (leftFlipper.statb == ButtonStatbs.IDLE && key == 'z') {
      leftFlipper.statb = ButtonStatbs.PRESSED;
    }
    if (rightFlipper.stat == ButtonStats.IDLE && key == 'x') {
      rightFlipper.stat = ButtonStats.PRESSED;
    }
  }

  public void returnFlip() {
    if (key == 'z') {
      leftFlipper.statb = ButtonStatbs.IDLE;
    }
    if (key == 'x') {
      rightFlipper.stat = ButtonStats.IDLE;
    }
  }
}
