public class RotateFlipper {//verschil tussen de 2 balken is 200 precies dus doorbij de ene zoveel erbij te doen als bij de andere eraf te halen krijg je gelijke flippers
  private Flipper leftFlipper = new Flipper(558, 640, 60, 15);
  private Flippern rightFlipper = new Flippern(720, 640, 60, -15);
  private Flipper upleftFlipper = new Flipper(528, 364, 60, 15);
  private Flippern uprightFlipper = new Flippern(750, 364, 60, -15);
//de stand aanroepen van de flippers met enums
  public RotateFlipper() {
    leftFlipper.statb = ButtonStatbs.IDLE;
    upleftFlipper.statb = ButtonStatbs.IDLE;
    rightFlipper.stat = ButtonStats.IDLE;
    uprightFlipper.stat = ButtonStats.IDLE;
  }
//flippers laten verschijnen
  public void draw() {
    leftFlipper.draw();
    rightFlipper.draw();
    upleftFlipper.draw();
    uprightFlipper.draw();
  }

  public void flipFlip() {
    if (leftFlipper.statb == ButtonStatbs.IDLE && key == 'z') {
      leftFlipper.statb = ButtonStatbs.PRESSED;
      upleftFlipper.statb = ButtonStatbs.PRESSED;
    }
    if (rightFlipper.stat == ButtonStats.IDLE && key == 'x') {
      rightFlipper.stat = ButtonStats.PRESSED;
      uprightFlipper.stat = ButtonStats.PRESSED;
    }
  }

  public void returnFlip() {
    if (key == 'z') {
      leftFlipper.statb = ButtonStatbs.IDLE;
      upleftFlipper.statb = ButtonStatbs.IDLE;
    }
    if (key == 'x') {
      rightFlipper.stat = ButtonStats.IDLE;
      uprightFlipper.stat = ButtonStats.IDLE;
    }
  }
}
//currentrotation-0.17453292
//currentrotation-0.34906584
//currentrotation-0.5235988
//currentrotation-0.6981317
//currentrotation-0.8726646
//currentrotation-1.0471975
