class Rocket
{
  int X_Pos, Y_Pos;
  int radius=50;
  public int xDir = -5, yDir = -2;
  public Rocket()
  {
    create();
  }
  public void Draw_Rocket()
  {
    fill(122);
    stroke(0);
    circle(X_Pos,Y_Pos,radius);
  }
  void moveBall()
  {
    X_Pos += xDir;
    Y_Pos += yDir;
  }
  //when collision with Field bounce
  //void bounceBall()
  //{
  //   if ((X_Pos < radius/2+7.5 || X_Pos > width - radius/2-7.5) && (Y_Pos > height/2 + 100 - radius/2 || Y_Pos < height/2 - (100 - radius/2))) xDir *= -1;
  //  if (Y_Pos < radius/2+7.5 || Y_Pos > height - radius/2-7.5) yDir *= -1;
  //}
  //to calculate Collision
  public int getRadius()
  {
    return this.radius;
  }
  public int get_X_Pos()
  {
    return this.X_Pos;
  }
  public int get_Y_Pos()
  {
    return this.Y_Pos;
  }
  public int get_Y_Direction()
  {
    return this.yDir;
  }
  public int get_X_Direction()
  {
    return this.xDir;
  }
  public void create()
  {
    X_Pos=width/2;
    Y_Pos=height/2;
    xDir = -5;
    yDir = -2;
  }
}
