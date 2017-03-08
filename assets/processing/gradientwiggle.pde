//Conor Maley
//Gradient wiggle
//wiggle gets larger as your mouse gets closer.

float moveX = 0;
float moveY = 0;
int size_ = 10;

float wiggleSize = 1;


void setup() {
  size(600, 600);
  ellipseMode(CENTER);
}

void draw() {
  background(255);
  
  wiggleSize = 0.2 * abs((width/2) - mouseX) + 1;
  
  //line(width/2, 0, width/2, height);
  for(float i = -size_; i < height + size_; i+=(size_ * 2)) {
    fill(height - i - 200);
    ellipse(width/2 + cos(moveY/20 + moveX)*(i/wiggleSize), i + (moveY % 20), size_, size_);
    moveX++;
  }
  
  moveY++;
}