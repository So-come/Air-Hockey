class Block
{
  float X_Pos;
  float Y_Pos;
  int radius=50;
  float coolTime;
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
      //fill(255);
      stroke(250,5,5);
      //mute item circle, textbox
      //circle(X_Pos,Y_Pos,radius);
      //textSize(radius/2);
      //text("?",X_Pos,Y_Pos);
      image(img,X_Pos,Y_Pos,50,50);
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
    this.coolTime=random(30)+10;
  }
  //void bounceBall()
  //{
  //  if ((X_Pos < radius/2+7.5 || X_Pos > width - radius/2-7.5) && (Y_Pos > height/2 + 100 - radius/2 || Y_Pos < height/2 - (100 - radius/2))) xDir *= -1;
  //  else if (Y_Pos < radius/2+7.5 || Y_Pos > height - radius/2-7.5) yDir *= -1;
  //}
}
