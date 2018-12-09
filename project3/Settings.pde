public class Settings {
  PImage underConstruction;
  //variables for the main menu settings
  String[] d = {"a", "b", "c", "d"};
  int u= 15;
  int o=15;
  int p=15;
  int x= 120;
  String test;
  int[] names = new int[10];
  int y = 100;
  //dit is voor de settings knop op het hoofdmenu, ball kleur kunnen veranderen, timer invoeren(modus), zwaartekracht aanpassen, thema(achtergrond en level)veranderen en score resetten

public void init(){
underConstruction = loadImage("under construction.jpg");
}

  public void draw() {
    fill(255);
    background(underConstruction);
    //for (int i = 0; i<4; i++) {
    //  text(d[i], 100, y);
    //  y += 50;
    //  if(i >= 4)
    //  break;
    //}
    //for (int j = 0; j<255; j+=15){
    //rect(x,90,15,15);
    
    //x += 15;
    //}
    
  }
}
