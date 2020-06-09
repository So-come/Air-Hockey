Field f;
Player1 p1;
Player2 p2;
Rocket r;
Initial_Screen is;
Block b;
int start=0;

int red_score, green_score = 0;

boolean up1, down1, left1, right1, up2, down2, left2, right2;

void setup() {
  background(0);
  size (1600,800);
  f=new Field(width,height);
  r=new Rocket();
  p1=new Player1(f.X_Area/5,f.Y_Area/2);
  p2=new Player2(f.X_Area/5*4,f.Y_Area/2);
  is=new Initial_Screen();
  b=new Block();
}

void draw() {
  
  if(start==0)
    is.draw_Screen();
  else {
    p1.move(left1, right1, up1, down1);
    p2.move(left2, right2, up2, down2);
    crash_R_and_P1(r, p1);
    crash_R_and_P2(r, p2);
    crash_Block_and_P1(b, p1);
    crash_Block_and_P2(b, p2);
    f.Draw_Field();
   
    //red score
    fill (240);
    textSize (700);
    text (red_score, 150, 650);
    
    //blue score
    fill (240);
    textSize (700);
    text (green_score, 1000, 650);
    
    p1.Draw_Player();
    p1.Player1_limitation();
    p2.Draw_Player();
    p2.Player2_limitation();
    r.Draw_Rocket();
    r.moveBall();
    r.bounceBall();
    b.reduce_CT();
    b.draw_Block();
    b.bounceBall();
    crash_Block_and_Rocket(b,r);
    rocketOut(r);
  }
}

void keyPressed() {
  if (key=='w') {
    up1=true;   
  }
  if (key=='d') {
    right1=true;
  }
  if (key=='s') {
    down1=true;
  }
  if (key=='a') {
    left1=true;
  }
  if (keyCode==LEFT) {
    left2=true;
  }
  if (keyCode==RIGHT) {
    right2=true;
  }
  if (keyCode==DOWN) {
    down2=true;
  }
  if (keyCode==UP) {
    up2=true;
  }
}
void keyReleased() {
  if (key=='w') {
    up1=false;
  }
  if (key=='d') {
    right1=false;
  }
  if (key=='s') {
    down1=false;
  }
  if (key=='a') {
    left1=false;
  }
  if (keyCode==LEFT) {
    left2=false;
  }
  if (keyCode==RIGHT) {
    right2=false;
  }
  if (keyCode==DOWN) {
    down2=false;
  }
  if (keyCode==UP) {
    up2=false;
  }
}
//calculate crashing rocket and Player
void crash_R_and_P1(Rocket r, Player1 p1)
{
  if(((r.get_X_Pos()-r.getRadius()/2<p1.get_X_Pos()+p1.getRadius()/2)&&(r.get_X_Pos()+r.getRadius()/2>p1.get_X_Pos()-p1.getRadius()/2))
  &&((r.get_Y_Pos()-r.getRadius()/2<p1.get_Y_Pos()+p1.getRadius()/2)&&(r.get_Y_Pos()+r.getRadius()/2>p1.get_Y_Pos()-p1.getRadius()/2))
  )
  {
    if((r.get_Y_Pos()>p1.get_Y_Pos())&&(r.get_Y_Direction()>0)
    ||(r.get_Y_Pos()<p1.get_Y_Pos()&&(r.get_Y_Direction()<0)))
    {
    }
    else
    {
      r.yDir=r.yDir*(-1);
    }
    r.xDir=r.xDir*(-1);
  }
}

void crash_R_and_P2(Rocket r, Player2 p2)
{
  if(((r.get_X_Pos()-r.getRadius()/2<p2.get_X_Pos()+p2.getRadius()/2)&&(r.get_X_Pos()+r.getRadius()/2>p2.get_X_Pos()-p2.getRadius()/2))
  &&((r.get_Y_Pos()-r.getRadius()/2<p2.get_Y_Pos()+p2.getRadius()/2)&&(r.get_Y_Pos()+r.getRadius()/2>p2.get_Y_Pos()-p2.getRadius()/2))
  )
  {
    if((r.get_Y_Pos()>p2.get_Y_Pos())&&(r.get_Y_Direction()>0)
    ||(r.get_Y_Pos()<p2.get_Y_Pos()&&(r.get_Y_Direction()<0)))
    {
    }
    else
    {
      r.yDir=r.yDir*(-1);
    }
    r.xDir=r.xDir*(-1);
  }
}
//calculate crashing block and Player
void crash_Block_and_P1(Block r, Player1 p1)
{
  if(((r.get_X_Pos()-r.getRadius()/2<p1.get_X_Pos()+p1.getRadius()/2)&&(r.get_X_Pos()+r.getRadius()/2>p1.get_X_Pos()-p1.getRadius()/2))
  &&((r.get_Y_Pos()-r.getRadius()/2<p1.get_Y_Pos()+p1.getRadius()/2)&&(r.get_Y_Pos()+r.getRadius()/2>p1.get_Y_Pos()-p1.getRadius()/2))
  )
  {
    if((r.get_Y_Pos()>p1.get_Y_Pos())&&(r.get_Y_Direction()>0)
    ||(r.get_Y_Pos()<p1.get_Y_Pos()&&(r.get_Y_Direction()<0)))
    {
    }
    else
    {
      r.yDir=r.yDir*(-1);
    }
    r.xDir=r.xDir*(-1);
  }
}

void crash_Block_and_P2(Block r, Player2 p2)
{
  if(((r.get_X_Pos()-r.getRadius()/2<p2.get_X_Pos()+p2.getRadius()/2)&&(r.get_X_Pos()+r.getRadius()/2>p2.get_X_Pos()-p2.getRadius()/2))
  &&((r.get_Y_Pos()-r.getRadius()/2<p2.get_Y_Pos()+p2.getRadius()/2)&&(r.get_Y_Pos()+r.getRadius()/2>p2.get_Y_Pos()-p2.getRadius()/2))
  )
  {
    if((r.get_Y_Pos()>p2.get_Y_Pos())&&(r.get_Y_Direction()>0)
    ||(r.get_Y_Pos()<p2.get_Y_Pos()&&(r.get_Y_Direction()<0)))
    {
    }
    else
    {
      r.yDir=r.yDir*(-1);
    }
    r.xDir=r.xDir*(-1);
  }
}
//calculate crashing Rocket and Block
void crash_Block_and_Rocket(Block r, Rocket p2)
{
  if(((r.get_X_Pos()-r.getRadius()/2<p2.get_X_Pos()+p2.getRadius()/2)&&(r.get_X_Pos()+r.getRadius()/2>p2.get_X_Pos()-p2.getRadius()/2))
  &&((r.get_Y_Pos()-r.getRadius()/2<p2.get_Y_Pos()+p2.getRadius()/2)&&(r.get_Y_Pos()+r.getRadius()/2>p2.get_Y_Pos()-p2.getRadius()/2))
  )
  {
    if((r.get_Y_Pos()>p2.get_Y_Pos())&&(r.get_Y_Direction()>0)
    ||(r.get_Y_Pos()<p2.get_Y_Pos()&&(r.get_Y_Direction()<0)))
    {
    }
    else
    {
      r.yDir=r.yDir*(-1);
    }
    r.xDir=r.xDir*(-1);
  }
}
//when the rocket is out the gamefield, Recreate it and give score to player 
void rocketOut(Rocket r)
{
  if(r.get_X_Pos()<5||r.get_X_Pos()>width-5||r.get_Y_Pos()<5||r.get_Y_Pos()>height-5)
  {
    if(r.get_X_Pos()<5||(r.get_Y_Pos()<height/2+f.get_GR()&&r.get_Y_Pos()>height/2-f.get_GR()))
    {
      p2.getScore();
    }
    else if(r.get_X_Pos()>width-5||(r.get_Y_Pos()<height/2+f.get_GR()&&r.get_Y_Pos()>height/2-f.get_GR()))
    {
      p1.getScore();
    }
    r.create();
  }
}
void getItemP1(Block r)
{
  if(r.get_X_Pos()<5||r.get_X_Pos()>width-5||r.get_Y_Pos()<5||r.get_Y_Pos()>height-5)
  {
    if(r.get_X_Pos()<5||(r.get_Y_Pos()<height/2+f.get_GR()&&r.get_Y_Pos()>height/2-f.get_GR()))
    {
      p2.getScore();
    }
    else if(r.get_X_Pos()>width-5||(r.get_Y_Pos()<height/2+f.get_GR()&&r.get_Y_Pos()>height/2-f.get_GR()))
    {
      p1.getScore();
    }
    r.create_Block();
  }
}
void mousePressed()
{
  start=1;
  
}
