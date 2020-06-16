class Initial_Screen
{
  public Initial_Screen()
  {
  }
  void draw_Screen()
  {
    textSize(170);
    text("Air Hockey", 380, 200);
  
    stroke(128);
    strokeWeight(7);
    line(380, 210, 1250, 210);
  
    textSize(45);
    text("Player 1 (Red) : w, a, s, d keys", 500, 350);
    text("Player 2 (Green) : Arrow keys", 500, 450);
    text("Make own goal to use the items!", 465, 550);
    textSize(100);
    text("Click to Start!!!", 460, 700);
    

  }
}
