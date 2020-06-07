class Player2
{
  float X_Pos,Y_Pos;
  public float radius=150;
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
    circle(X_Pos,Y_Pos,radius);
    fill(255);
    circle(X_Pos,Y_Pos,radius/2);
    fill(0,120,0);
    circle(X_Pos,Y_Pos,radius/4);
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
    if(X_Pos<radius/2+7.5)X_Pos=radius/2+8.5;
    if(Y_Pos<radius/2+7.5 || Y_Pos >height -radius/2+8.5);
  }
  //to calculate collision
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
}
