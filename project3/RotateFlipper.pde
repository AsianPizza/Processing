public class RotateFlipper {//verschil tussen de 2 balken is 200 precies dus doorbij de ene zoveel erbij te doen als bij de andere eraf te halen krijg je gelijke flippers
  private Flipper leftFlipper = new Flipper(558, 640, 50, 15);
  private Flipper topLeftFlipper = new Flipper(558, 900, 50, 15);
  private Flippern rightFlipper = new Flippern(720, 640, 50, -15);
  private Flippern topRightFlipper = new Flippern(720, 900, 50, -15);
//de stand aanroepen van de flippers met enums
  public RotateFlipper() {
    leftFlipper.statb = ButtonStatbs.IDLE;
    rightFlipper.stat = ButtonStats.IDLE;
  }
//flippers laten verschijnen
  public void draw() {
    topLeftFlipper.draw();
    leftFlipper.draw();
    rightFlipper.draw();
    topRightFlipper.draw();
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
//currentrotation-0.17453292
//currentrotation-0.34906584
//currentrotation-0.5235988
//currentrotation-0.6981317
//currentrotation-0.8726646
//currentrotation-1.0471975
