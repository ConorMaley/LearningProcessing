//a man running then going over a hurdle
//Original concept by Conor Maley; modified by Mr. Corica
//To-do list:
//    Have the hurdle location easy to set/change (use variable instead of 400)
//    Fix problems with jumping code - runners not all run at the same time.
//    Announce winner?

// Variables and constants
int people = 10; //number of people
int d =0; //controls which is started
int z =0; //controls which is started
int stoprecord = 0; //controls recording of winner
int first = 0; //who one first
int man = 0; //which person for array
float[] xarray = new float[people]; //array of x values
float[] yarray = new float[people]; //array of y values
int[] carray = new int[people];
float headLevel = 120; // location of the man's head
float manHeight = 55; //hieght of man
float groundLevel = headLevel+manHeight; //ground level
float tempx = 0; //temporary x
float tempy =0; //temporary y

float jumpheight = groundLevel - 35; //

//-----------------------------------------------------------------------
void setup() {
  size(600, 200);
  background(255);
  smooth();
  frameRate(30);
  colorMode(HSB);
}
///////////////////////////////////////////////////////////////////////////////////
void draw() {
  background(255);
  strokeWeight(1); // ground
  line(0, groundLevel, width, groundLevel); //ground
  strokeWeight(3); // hurdle
  line(width/3*2, groundLevel, width/3*2, jumpheight); //hurdle
  ////////////////////////////////////////////////////////////////////
  if (d==0)
  { 
    for (int i =0; i < people; i++) {
      yarray[i] = headLevel;                      //resets array values
      xarray[i] = 0;
    }
    d++;
    z = 0;
  }
  /////////////////////////////////////////////////////
  if (z == 0)
  {
    runners(people);              //draws people and moves them
  }
  //////////////////////////////////////////////////////////
  else 
  {
    wwcd(first);                 //displays winner
  }
}
// End of draw() code////////////////////////////////
void mousePressed() {
  if (z==15) {  
    d = 0;
    stoprecord = 0;
  }
}


//---------------------------------------------------------------------------------
// Draws a stick man with head at location x,y, using color c
void drawStickMan(float x, float y, color c)
{
  strokeWeight(1);
  fill(c);
  ellipse(x, y, 15, 17);//head
  strokeWeight(1);
  line(x, y+35, x, y+8.5); //body
  line(x+13, y+22, x-13, y+22); //arms
  stroke(0); 
  if (x%4 >=2)
  {
    line(x, y+35, x-15, y+53); //leg1 apart
    line(x, y+35, x+15, y+53); //leg2
  }
  else
  {
    line(x, y+35, x-5, y+53); //leg1 near each other
    line(x, y+35, x+5, y+53); //leg2
  }
} // End of drawStickMan() code
///////////////////////////////////////////////////////////////////////////////////////////////
//display winner/////////////////////////////////
void wwcd(int winner) {
  String s = "Man number " +(winner+1) + " won the race!"; //who won
  z = 15;
  text(s, (width/2 - 80), height/2); // displays winner
}
/////////////////////////////////////////////////////////////////////////
//draws runnes and stores values//
void runners (int Runners)
{
  for (int man = 0; man < Runners; man++) {
    tempx = xarray[man];
    tempy = yarray[man];
    drawStickMan(tempx, tempy, color(man*10, 255, 150));
    ////////////////////////////////////////////
    if ( tempx < 350 || tempx > 450)
    {
      if (random(0, 100)>50) //speed controller
      { 
        tempx= tempx + 1;
      }
      else
      {
        tempx = tempx + 3.5;
      }
    }
    else
    {
      tempy = tempy + .064*(tempx-400);
      tempx = tempx + 2;
    }
    ///////////////////////////////////////
    //    if (tempx > 350 && tempx < 400) { //up
    //      tempy = tempy - 1;
    //    }
    //    else if (tempx > 400 && tempx  < 450)      //orignial jumping
    //    { //down
    //      tempy = tempy + 1;
    //    }
    ///////////////////////////////////////////
    if (tempx >= width) { //end of race       
      z = 1;
      if (stoprecord==0)
      {
        first = man;
        stoprecord = 1;
      }
    }
    else //keep going
    {
      xarray[man]= tempx;
      yarray[man]= tempy;
    }
  }
}
