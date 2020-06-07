class Block
{
  float X_Pos;
  float Y_Pos;
  int radius=50;
  float coolTime;
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
      fill(255,0,0);
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
  public void create_Block()
  {
    this.X_Pos=random(1600-radius/2-7.5)+radius/2+7.5;
    this.Y_Pos=random(800-radius/2-7.5)+radius/2+7.5;
    this.coolTime=100;
  }
}
