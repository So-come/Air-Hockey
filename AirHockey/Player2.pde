class Player2
{
  int score=0;
  float X_Pos,Y_Pos;
  public float diameter=150;
  int xDir = 5, yDir = 5;
  
  public Player2(int x,int y)
  {
    X_Pos=x;
    Y_Pos=y;
  }
  //make Player2
  public void Draw_Player()
  {
    fill(0,255,0);
    stroke(5,250,5);
    circle(X_Pos,Y_Pos,diameter);
    fill(255);
    circle(X_Pos,Y_Pos,getRadius());
    fill(0,120,0);
    circle(X_Pos,Y_Pos,getRadius()/2);
  }
  //to move Player2
  void move(boolean up2, boolean down2, boolean left2, boolean right2) {
    if (up2==true) {
      X_Pos = X_Pos-xDir;
    }
    if (down2==true) {
      X_Pos = X_Pos+xDir;
    }
    if (left2 == true) {
      Y_Pos = Y_Pos-yDir;
    }
    if (right2 == true) {
      Y_Pos = Y_Pos+yDir;
    }
  }
  void Player2_limitation(){
    if(X_Pos<getRadius()+7.5 ) X_Pos=getRadius()+8.5;
    if(X_Pos>width-getRadius()-7.5)X_Pos=width-getRadius()-8.5;
    if(Y_Pos<getRadius()+7.5) Y_Pos=height-getRadius()-8.5;
    if(Y_Pos >height -getRadius()-7.5) Y_Pos=getRadius()+7.5;
  }
  //to calculate collision
  public float getRadius()
  {
    return this.diameter/2;
  }
  public float get_X_Pos()
  {
    return this.X_Pos;
  }
  public float get_Y_Pos()
  {
    return this.Y_Pos;
  }
  public void upScore()
  {
    this.score+=1;
  }
  public int getScore()
  {
    return this.score;
  }
}
