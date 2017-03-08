
void setup(){
size(400,400);
background(255);
}


void draw() {
fill(0);
ellipse(100, 100, 50, 50);
ellipse(300,100,50,50);
if(mousePressed == true) {
  line(mouseX,mouseY,pmouseX,pmouseY);
}
}

void keyPressed() {
  setup();
}