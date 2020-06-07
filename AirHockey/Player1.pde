class Player1
{
  int score=0;
  float X_Pos,Y_Pos;
  public float radius=150;
  int xDir = 5, yDir = 5;
  
  public Player1(int x,int y)
  {
    X_Pos=x;
    Y_Pos=y;
  }
  //make Palyer1
  public void Draw_Player()
  {
    fill(255,0,0);
    stroke(250,5,5);
    circle(X_Pos,Y_Pos,radius);
    fill(255);
    circle(X_Pos,Y_Pos,radius/2);
    fill(120,0,0);
    circle(X_Pos,Y_Pos,radius/4);
  }
  //to move Player1
    void move(boolean up1, boolean down1, boolean left1, boolean right1) {
    if (up1==true){
      X_Pos = X_Pos-xDir;
    }
    if (down1==true){
      X_Pos = X_Pos+xDir;
    }
    if (left1 == true){
      Y_Pos = Y_Pos-yDir;
    }
    if (right1 == true){
      Y_Pos = Y_Pos+yDir;
    }
  }
  void Player1_limitation(){
    if(X_Pos<radius/2+7.5 ) X_Pos=radius/2+8.5;
    if(X_Pos>width-radius/2-7.5)X_Pos=width-radius/2-8.5;
    if(Y_Pos<radius/2+7.5) Y_Pos=height-radius/2-8.5;
    if(Y_Pos >height -radius/2-7.5) Y_Pos=radius/2+7.5;
  }

  //to calculate Collision
  public float getRadius()
  {
    return this.radius;
  }
  public float get_X_Pos()
  {
    return this.X_Pos;
  }
  public float get_Y_Pos()
  {
    return this.Y_Pos;
  }
  public void getScore()
  {
    this.score+=1;
  }
}
