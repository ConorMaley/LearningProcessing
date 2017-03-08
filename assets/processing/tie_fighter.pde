//TIE-Fighter
//By: Conor Maley
//Use A + D to move, Space to shoot
//try hitting through the forcefield!

//USER VARIABLES
int x=300; //center of your circle
float dx=0; //movement variable
int y=300; //center of your circle
int circleradius=25;
int wingheight=260;
//-----------------------------------------------------//
//CPU VARIABLES 
float cpux = random(150, 450); //starting location
int cpuy = 100; //starting location
int dcpux = 0; //speed and direction of movements
float cpumovement = 1; //randomly changing variable deciding how cpu moves
//-----------------------------------------------------//
int hitcounter = 0;

void setup() {
  size(600, 400);
  background(0);
  smooth();
}

void draw() {
  background(0);
  stars();
  tiefighter(x, y);
  cpu(cpux, cpuy, cpumovement, hitcounter);
  if (cpux >= width) { //ablilty for cpu to switch over sides
    cpux = 0;
  }
  else if (cpux<=0) { //ability for cpu to switch over sides
    cpux=width;
  }
  if (x >= width) { //ablilty for you to switch over sides
    x = 0;
  }
  else if (x<=0) { //ability for you to switch over sides
    x=width;
  }
  //------------------------------------------------------------//
  //cpu movement decision maker//
  cpumovement = random(0, 1000);
  if (cpumovement >= 0 && cpumovement <= 4) {
    dcpux = 4;
  }
  else if (cpumovement >4 && cpumovement<=8) {
    dcpux = -4;
  }
  else if (cpumovement>8 && cpumovement<=16) {
    dcpux = -1;
  }
  else if (cpumovement>16 && cpumovement<=24) {
    dcpux = 1;
  }
  else if (cpumovement>24 && cpumovement<=40) {
    dcpux = 3;
  }
  else if (cpumovement>40 && cpumovement<=56) {
    dcpux = -3;
  }
  if (hitcounter>5) { //number of hits before wins
    background(255, 0, 0);
    println("WINNER");
    println("PRESS R TO RESTART");
    //display text here
  }

  x+=dx;
  cpux+=dcpux;
}

void keyPressed() {
  if (key == 'a') {//left
    dx=-2.5;
  }
  else if (key == 'd') {//right
    dx=3.0;
  }
  else if (key == 's') {//stop
    dx=0.0;
  }
  else if (key == ' ') {//shoot!/laser settings)
    stroke(0, 255, 0);
    strokeWeight(4);
    line(x, y-13, x, y-200);
    strokeWeight(1);
    stroke(200);
    if (x>=cpux-15 && x<=cpux+15) {
      println("HIT");
      hitcounter=hitcounter+1;
      println(hitcounter);
    }
  }
  else if (key == 'r') {
    hitcounter =0;
  }
}


void keyReleased() {
  if (key == 'a') {
    dx=-0.5;
  }
  if (key == 'd') {
    dx=1;
  }
}

void tiefighter(int x, int y) {

  fill(200);
  stroke(200);
  ellipse(x, y, circleradius, circleradius);
  line(x, y, x+35, y);
  line(x, y, x-35, y);
  rect(x+35, wingheight, 5, 80);
  rect(x-35, wingheight, 5, 80);
}

void cpu(float cpux, int cpuy, float cpumovement, int hitcounter) {
  //FORCEFIELD
  fill(0);
  stroke(100);
  if (hitcounter>4) {
    stroke(0);
  }
  ellipse(cpux, cpuy, 35, 30);
  strokeWeight(5);
  stroke(0);
  line(cpux, cpuy+10, cpux, cpuy+30);
  //SHIP
  strokeWeight(3);
  fill(200);
  stroke(200);
  if (hitcounter>5) {
    stroke(0);
    fill(0);
  }
  ellipse(cpux, cpuy, 10, 10);
  line(cpux, cpuy, cpux+20, cpuy+15);
  line(cpux, cpuy, cpux+20, cpuy-15);
  line(cpux, cpuy, cpux-20, cpuy+15);
  line(cpux, cpuy, cpux-20, cpuy-15);
}

void stars() {
  for (int i = 0; i <10; i++) {
    stroke(200);
    strokeWeight(3);
    point(random(0, width), random(0, height));
  }
}

