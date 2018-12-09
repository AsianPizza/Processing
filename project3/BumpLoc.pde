public class BumpLoc {
  public int total;
      public float x;
  public float y;
    Bumper bumper1 = new Bumper(650, 500, 35, 35);
    Bumper bumper2 = new Bumper(1145, 165, 35, 35);
    Bumper bumper3 = new Bumper(65, 85, 35, 35);
    Bumper bumper4 = new Bumper(95, 165, 35, 35);
    Bumper bumper5 = new Bumper(155, 105, 35, 35);
    Bumper bumper6 = new Bumper(1165, 385, 35, 35);
    Bumper bumper7 = new Bumper(990, 480, 35, 35);
    Bumper bumper8 = new Bumper(1035, 560, 35, 35);
    Bumper bumper9 = new Bumper(940, 550, 35, 35);



  public void draw() {
    fill(255, 0, 255);
    if(bumper1.hit || bumper2.hit || bumper3.hit || bumper4.hit || bumper5.hit || bumper6.hit || bumper7.hit || bumper8.hit || bumper9.hit){
 total += 100;
 bumperhit.play();
}
text(total, 640, 50);
    bumper1.draw();
    bumper2.draw();
    bumper3.draw();
    bumper4.draw();
    bumper5.draw();
    bumper6.draw();
    bumper7.draw();
    bumper8.draw();
    bumper9.draw();

  }
}
