public class Spring {
  //Setting up variables to use in the spring
  public float w = 50;
  public float h = 10;
  private PVector location;
  private boolean shoot;

  public Spring(float x, float y) {
    location = new PVector(x, y);
  }
  
  //Setting the minimal and maximal y for the spring location
  public final float MIN_Y = 360;
  public final float MAX_Y = 700;
  
  //To be used when the spring is in its intial state, and making sure it gradually goes up rather than instantly jumping to the new location
  private void displaySpring(float springSpeed) {
    springSpeed *= 1.5;
    location.y -= springSpeed;
    location.y = Mathf.clamp(location.y, MIN_Y, MAX_Y);
    rect(location.x, location.y, w, h);
  }
  //To be used when the spring has been dragged down
  private void displaySprung(float springSpeed) {
    springSpeed *= .45;
    location.y += springSpeed;
    location.y = Mathf.clamp(location.y, MIN_Y, MAX_Y);
    rect(location.x, location.y, w, h);
  }
  //Checking whether the down key is pressed and adjusting boolean shoot accordingly
  public void keyPressed() {
    if (key == CODED && keyCode == DOWN && !shoot) {
      shoot = !shoot;
    }
  }

  public void keyReleased() {
    if (key == CODED && keyCode == DOWN && shoot) {
      shoot = !shoot;
    }
  }

  private void draw() {
    fill(0, 0, 0);
    //Displaying the correct state of the spring based on the current state of shoot
    if (!shoot) {
      displaySpring(10);
    } else if (shoot)
      displaySprung(15);
      
  }
}
