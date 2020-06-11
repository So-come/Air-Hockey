class Player1
{
  int score=0;
  float X_Pos,Y_Pos;
  public float diameter=150;
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
    circle(X_Pos,Y_Pos,diameter);
    fill(255);
    circle(X_Pos,Y_Pos,getRadius());
    fill(120,0,0);
    circle(X_Pos,Y_Pos,getRadius()/2);
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
    if(X_Pos<getRadius()+7.5 ) X_Pos=getRadius()+8.5;
    if(X_Pos>width-getRadius()-7.5)X_Pos=width-getRadius()-8.5;
    if(Y_Pos<getRadius()+7.5) Y_Pos=height-getRadius()-8.5;
    if(Y_Pos >height -getRadius()-7.5) Y_Pos=getRadius()+7.5;
  }

  //to calculate Collision
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
