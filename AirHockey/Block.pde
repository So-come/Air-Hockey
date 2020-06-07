class Block // 골대 생성 아이템
{
  int w;
  float X_Pos;
  float Y_Pos;
  int radius=50;
  float coolTime;
  boolean flag = false;
  public float xDir=5,yDir=2;
  public Block()
  {
    create_Block();
  }
  public void reduce_CT()
  {
    if(coolTime>0.0)
      coolTime-=0.01;
     else
       coolTime=0.0;
  }
  public void draw_Block()
  {
    if(coolTime==0)
    {
      X_Pos+=xDir;
      Y_Pos+=yDir;
      fill(255);
      stroke(250,5,5);
      circle(X_Pos,Y_Pos,radius);
      textSize(radius/2);
      text("?",X_Pos,Y_Pos);
    }
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
  public float get_Y_Direction()
  {
    return this.yDir;
  }
  public float get_X_Direction()
  {
    return this.xDir;
  }
  public void create_Block()
  {
    this.X_Pos=random(1600-radius/2-7.5)+radius/2+7.5;
    this.Y_Pos=random(800-radius/2-7.5)+radius/2+7.5;
    this.coolTime=10;
  }
  void bounceBall()
  {
     if ((X_Pos < radius/2+7.5 || X_Pos > width - radius/2-7.5) && (Y_Pos > height/2 + 100 - radius/2 || Y_Pos < height/2 - (100 - radius/2)) && !flag) xDir *= -1;
    else if (X_Pos < radius/2+7.5 || X_Pos > width - radius/2-7.5) flag = true;
    if (Y_Pos < radius/2+7.5 || Y_Pos > height - radius/2-7.5) yDir *= -1;
  }
}
