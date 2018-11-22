public class Lijst{
  //variables for the main menu score list
String[] s = {"a", "b", "c", "d", "e", "f", "g", "h", "i", "j"};

int[] namen = new int[10];
int y = 100;
//dit is voor de scoreboard knop op het hoofdmenu


public void draw(){
  noLoop();
  fill(0);
for(int i = 0; i<10; i++){
text(s[i], 650, y);
y += 50;
}

}


}
