int x=0;
int increment=2;

void setup() {
  size(400, 100);
  strokeWeight(5);
}

void draw() {
  background(255);
  if(x>400) {
    increment=-2;
  }
  if(x<0) {
    increment=2;
  }
  x=x+increment;
  ellipse(x, 50, 25, 25);
}
