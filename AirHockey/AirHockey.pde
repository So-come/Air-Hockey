Field f;
Player1 p1;
Player2 p2;
Rocket r;
Initial_Screen is;
Block b1;
Block b2;
Block b3;
int start=0;
PImage img;

boolean up1, down1, left1, right1, up2, down2, left2, right2;

void setup() {
  background(0);
  size (1600,800);
  f=new Field(width,height);
  r=new Rocket();
  p1=new Player1(f.X_Area/5,f.Y_Area/2);
  p2=new Player2(f.X_Area/5*4,f.Y_Area/2);
  is=new Initial_Screen();
  b1=new Block();
  b2=new Block();
  b3=new Block();
  img=loadImage("img.png");
}

void draw() {
  
  if(start==0)
    is.draw_Screen();
  else {
    p1.move(left1, right1, up1, down1);
    p2.move(left2, right2, up2, down2);
    crash_R_and_P1(r, p1);
    crash_R_and_P2(r, p2);
    crash_Block_and_P1(b1, p1);
    crash_Block_and_P2(b1, p2);
    crash_Block_and_P1(b2, p1);
    crash_Block_and_P2(b2, p2);
    crash_Block_and_P1(b3, p1);
    crash_Block_and_P2(b3, p2);
    f.Draw_Field();
   
    //red score
    fill (240);
    textSize (700);
    text (p1.getScore(), 150, 650);
    
    //green score
    fill (240);
    textSize (700);
    text (p2.getScore(), 1000, 650);
    
    p1.Draw_Player();
    p1.Player1_limitation();
    p2.Draw_Player();
    p2.Player2_limitation();
    r.Draw_Rocket();
    r.moveBall();
    R_bounceBall(r);
    b1.reduce_CT();
    b1.draw_Block();
    B_bounceBall(b1);
    crash_Block_and_Rocket(b1,r);
    b2.reduce_CT();
    b2.draw_Block();
    B_bounceBall(b2);
    crash_Block_and_Rocket(b2,r);
    b3.reduce_CT();
    b3.draw_Block();
    B_bounceBall(b3);
    crash_Block_and_Rocket(b3,r);
    rocketOut(r);
    getItem(b1);
    getItem(b2);
    getItem(b3);
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
  if(((r.get_X_Pos()-r.getRadius()<p1.get_X_Pos()+p1.getRadius())&&(r.get_X_Pos()+r.getRadius()>p1.get_X_Pos()-p1.getRadius()))
  &&((r.get_Y_Pos()-r.getRadius()<p1.get_Y_Pos()+p1.getRadius())&&(r.get_Y_Pos()+r.getRadius()>p1.get_Y_Pos()-p1.getRadius()))
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
  if(((r.get_X_Pos()-r.getRadius()<p2.get_X_Pos()+p2.getRadius())&&(r.get_X_Pos()+r.getRadius()>p2.get_X_Pos()-p2.getRadius()))
  &&((r.get_Y_Pos()-r.getRadius()<p2.get_Y_Pos()+p2.getRadius())&&(r.get_Y_Pos()+r.getRadius()>p2.get_Y_Pos()-p2.getRadius()))
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
  if(((r.get_X_Pos()-r.getRadius()<p1.get_X_Pos()+p1.getRadius())&&(r.get_X_Pos()+r.getRadius()>p1.get_X_Pos()-p1.getRadius()))
  &&((r.get_Y_Pos()-r.getRadius()<p1.get_Y_Pos()+p1.getRadius())&&(r.get_Y_Pos()+r.getRadius()>p1.get_Y_Pos()-p1.getRadius()))
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

void crash_Block_and_P2(Block b, Player2 p2)
{
  if(((b.get_X_Pos()-b.getRadius()<p2.get_X_Pos()+p2.getRadius())&&(b.get_X_Pos()+b.getRadius()>p2.get_X_Pos()-p2.getRadius()))
  &&((b.get_Y_Pos()-b.getRadius()<p2.get_Y_Pos()+p2.getRadius())&&(b.get_Y_Pos()+b.getRadius()>p2.get_Y_Pos()-p2.getRadius()))
  )
  {
    if((b.get_Y_Pos()>p2.get_Y_Pos())&&(b.get_Y_Direction()>0)
    ||(b.get_Y_Pos()<p2.get_Y_Pos()&&(b.get_Y_Direction()<0)))
    {
    }
    else
    {
      b.yDir=b.yDir*(-1);
    }
    b.xDir=b.xDir*(-1);
  }
}
//calculate crashing Rocket and Block
void crash_Block_and_Rocket(Block b, Rocket p2)
{
  if(((b.get_X_Pos()-b.getRadius()<p2.get_X_Pos()+p2.getRadius())&&(b.get_X_Pos()+b.getRadius()>p2.get_X_Pos()-p2.getRadius()))
  &&((b.get_Y_Pos()-b.getRadius()<p2.get_Y_Pos()+p2.getRadius())&&(b.get_Y_Pos()+b.getRadius()>p2.get_Y_Pos()-p2.getRadius()))
  )
  {
    if((b.get_Y_Pos()>p2.get_Y_Pos())&&(b.get_Y_Direction()>0)
    ||(b.get_Y_Pos()<p2.get_Y_Pos()&&(b.get_Y_Direction()<0)))
    {
    }
    else
    {
      b.yDir=b.yDir*(-1);
    }
    b.xDir=b.xDir*(-1);
  }
}
//when the rocket is out the gamefield, Recreate it and give score to player 
void rocketOut(Rocket r)
{
  if(r.get_X_Pos()<5||r.get_X_Pos()>width-5||r.get_Y_Pos()<5||r.get_Y_Pos()>height-5)
  {
    if(r.get_X_Pos()<5&&(r.get_Y_Pos()<height/2+f.get_GR()&&r.get_Y_Pos()>height/2-f.get_GR()))
    {
      p2.upScore();
    }
    else if(r.get_X_Pos()>width-5&&(r.get_Y_Pos()<height/2+f.get_GR()&&r.get_Y_Pos()>height/2-f.get_GR()))
    {
      p1.upScore();     
    }
    r.create();
  }
}
void getItem(Block b)
{
  if(b.get_X_Pos()<5||b.get_X_Pos()>width-5||b.get_Y_Pos()<5||b.get_Y_Pos()>height-5)
  {
    //if player2 get Item
    if(b.get_X_Pos()<5||(b.get_Y_Pos()<height/2+f.get_GR()&&b.get_Y_Pos()>height/2-f.get_GR()))
    {
      switch(b.getItem())
      {
        case 0:
        
        break;
        case 1:
        
        break;
        case 2:
        
        break;
        case 3:
        
        break;
        case 4:
         
        break;
        case 5:
        
        break;
  }
    }
    //if player1 get Item
    else if(b.get_X_Pos()>width-5||(b.get_Y_Pos()<height/2+f.get_GR()&&r.get_Y_Pos()>height/2-f.get_GR()))
    {
      switch(b.getItem())
      {
        case 0:
        
        break;
        case 1:
        
        break;
        case 2:
        
        break;
        case 3:
        
        break;
        case 4:
        
        break;
        case 5:
        
        break;
      }
    }
    b.create_Block();
  }
}
void R_bounceBall(Rocket r)
{
  if ((r.get_X_Pos() < r.getRadius()+7.5 || r.get_X_Pos() > width - r.getRadius()-7.5) && (r.get_Y_Pos() > height/2 + f.get_GR() - r.getRadius() || r.get_Y_Pos() < height/2 - (f.get_GR() - r.getRadius()))) r.xDir *= -1;
  else if (r.get_Y_Pos() < r.getRadius()+7.5 || r.get_Y_Pos() > height - r.getRadius()-7.5) r.yDir *= -1;
}
void B_bounceBall(Block b)
{
  if ((b.get_X_Pos() < b.getRadius()+7.5 || b.get_X_Pos() > width - b.getRadius()-7.5) &&
  (b.get_Y_Pos() > height/2 + f.get_GR() - b.getRadius() || b.get_Y_Pos() < height/2 - (f.get_GR() - b.getRadius()))) b.xDir *= -1;
  else if (b.get_Y_Pos() < b.getRadius()+7.5 || b.get_Y_Pos() > height - b.getRadius()-7.5) b.yDir *= -1;
}
void mousePressed()
{
  start=1;
  
}
