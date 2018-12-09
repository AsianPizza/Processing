public class Lijst {
  PImage scorebg;
  //variables for the main menu score list
  //String[] s = {"a", "b", "c", "d", "e", "f", "g", "h", "i", "j"};
  //int[] namen = new int[10];
  //int y = 100;
      
    //noLoop();
    //fill(0);
    //for (int i = 0; i<10; i++) {
    //  text(s[i], 650, y);
    //  y += 50;
    //}
public void init(){
scorebg = loadImage("scoreboard.jpg");

}
  


  public void draw() {
    background(scorebg);
    fill(255);
    fill(0, 0, 255);
    text(" Place ", 100, 450);
    text(" Name ", 400, 450);
    text(" Score ", 700, 450);
    for (int iScore=0; iScore<highscores.getScoreCount(); iScore++) {
      if (iScore >= 3) break;
       // fetch a score from the list
    Score score = highscores.getScore(iScore);

    // display score in window
    text((iScore+1) + "         " + score.name + "          " + score.score, 110 + iScore*350, 110 + iScore*100);
    }
      // for each score in list
  for (int iScore=0; iScore<highscores.getScoreCount(); iScore++) {

    // only show the top 10 scores
    if (iScore >= 9) break;
    if (iScore <= 2) continue;
    
    // fetch a score from the list
    Score score = highscores.getScore(iScore);

    // display score in window
    text((iScore+1) + "                            " + score.name + "                         " + score.score, 110, 410 + iScore*35);

    
  }
  }
 

}
