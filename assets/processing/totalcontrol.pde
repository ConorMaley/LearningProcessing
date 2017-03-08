//a circle being controled by you.

int x = 300;
int y = 200;
void setup() {
  size(600, 400);
  background(255);
}


void draw() {
  background(255);
  fill(x);
  ellipse(x, y, 25, 25);
}

void keyPressed() {
 
  if (key == 'a') { //moveleft
    x = x - 2;
  }
  if (key == 'd') { //moveright
    x = x + 2;
  }
  if (key == 'w') { //moveup
    y = y-2;
  }
  if (key == 's') { //movedown
    y=y+2;
  }
  //if (key == 'a'&&'w') { //moving them diagonally???? is it possible?
    //x--;
    //y--;
  //}
}
