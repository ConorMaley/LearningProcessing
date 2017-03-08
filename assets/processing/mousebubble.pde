int counter = 0;
int max_size = 50;


Bubble b = new Bubble();

void setup() {
  size(600, 400);
  frameRate(30);
}

void draw() {
  background(255);
  b.expand();
  if(b.get_size() > max_size) {
    b.pop();
  }    
  
  b.draw();
  
  counter++;
  
}

boolean bubbletime() {
  
// Do something every second.

//  if(counter > frameRate) {
//    counter = 0;
//    return true;
//  }
  return false;


}

class Bubble {
  int size, x, y;
  
  Bubble() {
    size = 0;
  }
  
  void expand() {
    size += 3;
  }
  
  void draw() {
    ellipse (mouseX, mouseY, size, size);
  }
  
  void pop() {
    size = 0;
  }
  
  int get_size() {
    return size;
  }
}