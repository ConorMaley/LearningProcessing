//a man running then going over a hurdle
//by Conor Maley

int x = 550;
int y = 80;

void setup() {
  size(600, 200);
  background(255);
  smooth();
  frameRate(45);
}

void draw() {
  background(255);
  strokeWeight(1);
  line(0, height-25, width, height-25); //ground
  strokeWeight(3);
  line(400, height-25, 400, height-50); //hurdle
  strokeWeight(1);
  ellipse(width - x, height-y, 15, 17);//head
  strokeWeight(1);
  line(width-x,height-y+35, width-x, height-y+8.5); //body
  line(width-x,height-y+35, width-x-15, height-y+53); //leg1
  line(width-x,height-y+35, width-x+15, height-y+53); //leg2
  line(width-x+13,height-y+22,width-x-13,height-y+22); //arms
  x--;
    
  if(x < 245) { //up
    y = y +1;
  }
    if(x < 195) { //down
      y = y -2;
    }
    if(y <= 80 && x <= 145) {//stay on ground level
y = y + 1;
    }
    if(x == 0) { //repeat
      x = width;
      y = 80;
    }
  }
  

