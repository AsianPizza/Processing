public class BumpLoc {
  public int total;
  public Bumper[] Bumper;
  public float x;
  public float y;
  public int topLeftBumper = 3;
  public int bottomLeftBumper = 3;
  public int bottomRightBumper = 3;
  Bumper bumper1 = new Bumper(650, 500, 35, 35);
  Bumper bumper2 = new Bumper(1145, 165, 35, 35);
  Bumper bumper3 = new Bumper(65, 85, 35, 35);
  Bumper bumper4 = new Bumper(95, 165, 35, 35);
  Bumper bumper5 = new Bumper(155, 105, 35, 35);
  Bumper bumper6 = new Bumper(1165, 385, 35, 35);
  Bumper bumper7 = new Bumper(990, 480, 35, 35);
  Bumper bumper8 = new Bumper(1035, 560, 35, 35);
  Bumper bumper9 = new Bumper(940, 550, 35, 35);

  BumpLoc() {
    Bumper = new Bumper[topLeftBumper];
    for (int i = 0; i < topLeftBumper; i++ ) {
      Bumper[i] = new Bumper(100 + 75 * i,300+ 100  * sin(i), 35, 35);
    }
  }
  public void init() {
    bumperHitParticle= new ParticleSystem(width/2, height/2);
    bumperHitParticle.spreadFactor=4.0;
    bumperHitParticle.minSpeed=1.0;
    bumperHitParticle.maxSpeed=1.0;
    bumperHitParticle.startVx=0.0069930553;
    bumperHitParticle.startVy=0.0069930553;
    bumperHitParticle.particleShape="quad";
    bumperHitParticle.emitterType="point";
    bumperHitParticle.birthSize=14.846153;
    bumperHitParticle.deathSize=1.0;
    bumperHitParticle.gravity=-0.0062937066;
    bumperHitParticle.birthColor=color(0.0, 255.0, 0.0, 255.0);
    bumperHitParticle.deathColor=color(169.0, 0.0, 174.0, 175.0);
    bumperHitParticle.blendMode="add";
    bumperHitParticle.framesToLive=58;
  }


  public void draw() {
    fill(255, 0, 255);
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
    bumperHitParticle.update();
    bumperHitParticle.draw();
    for (int i = 0; i < topLeftBumper; i++ ) {
      Bumper[i].draw();
    }
  }
}
