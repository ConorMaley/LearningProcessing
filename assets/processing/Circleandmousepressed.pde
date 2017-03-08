//a circle being controled by you.
//and you have to avoid the circles coming after you.
int x = 300;
int dx = 0; // How much x changes during each draw() call, i.e., the x-speed.
int y = 200;
int dy = 0;
//float ballx = random(-50,width+width/10);
//float bally = random(-50,height+height/10);

void setup() {
  size(600, 400);
  background(255);
  frameRate(30);
}

void draw() {
  background(255);
  fill(x, -x, -x);
  ellipse(x, y, 25, 25);//circle
  x+=dx;
  y+=dy;
  if(x >= width) {//x-transfer between borders
    x=0;
  }
  else if(x <= 0) {
    x=width;
  }
  if(y >= height || y <= 0) {//y-border
    dy=0;
    y=0;
  }
  if(mousePressed == true) {
    line(x,y,mouseX,mouseY);
  }
}

void keyPressed() {
  if (key == 'a') { //moveleft
    dx=-2;
  }
  else if (key == 'd') { //moveright
    dx=2;
  }
  else if (key == 'w') { //moveup
    dy=-1;
  }
  else if (key == 's') { //movedown
    dy=1;
  }
  else if (key == ' ') { // stop!
  dx=0;
  dy=0;
  }
}
