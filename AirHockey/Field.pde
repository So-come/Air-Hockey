class Field
{
  public int X_Area,Y_Area,C_Area;
  int rect_X,rect_Y,rect_C;
  float goal_diameter=250;
  
  public Field(int Window_Width,int Window_Height)
  {
    
    X_Area=Window_Width;
    Y_Area=Window_Height;
    rect_X=X_Area-10;
    rect_Y=Y_Area-10;
    
  }
  //make game field
  public void Draw_Field()
  {
    background(255);
    fill(255);
    stroke(0);
    strokeWeight(5);
    //draw boundary line
    rect(5,5,rect_X,rect_Y);
    //draw center circle
    circle(X_Area/2,Y_Area/2,Y_Area/4);
    //draw center line
    line(X_Area/2,5,X_Area/2,Y_Area-5);//maybe it's fixed
    //draw the gall
    noStroke();
    circle(5,rect_Y/2,get_GR()*2);
    circle(rect_X,rect_Y/2,get_GR()*2);   
  }
  public float get_GR()
  {
    return this.goal_diameter/2;
  }
  public void set_GR(float change)
  {
    this.goal_diameter=change*2;
  }
}
