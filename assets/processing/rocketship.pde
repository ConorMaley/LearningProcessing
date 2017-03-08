//Conor's Rocket ship
//Press the mouse to go faster
//Hint: Use your imagination



void setup() {
  size(500, 500);
  background(150);
}
int z = 0; //step of change of rocket fire
int w = 0; //changes the state of positiveity/negativeity of c
int c = 1; //controls the if/else statement(changes the fire itself)
void draw() {
  background(0);
  fill(255);
  stroke(255);
  rect(mouseX - 25, mouseY - 10, 50, 20);
  triangle(mouseX + 25, mouseY + 10, mouseX + 25, mouseY - 10, mouseX + 40, mouseY);


  if (mousePressed == true) {
    fill(200, 50, 50);
    stroke(200, 50, 50);
    z = z + 1;
    w = z%5;
    if (w == 0) {
      c = c*-1;
    }
    else {
      c = c;
    }
    if (c == 1) {
      triangle(mouseX - 25, mouseY + 10, mouseX - 35, mouseY + 15, mouseX - 25, mouseY + 2);
      triangle(mouseX - 25, mouseY + 7, mouseX - 40, mouseY + 5, mouseX - 25, mouseY);
      triangle(mouseX - 25, mouseY, mouseX - 43, mouseY, mouseX - 25, mouseY - 4);
      triangle(mouseX - 25, mouseY - 7, mouseX - 47, mouseY - 5, mouseX - 25, mouseY - 3);
      triangle(mouseX - 25, mouseY - 10, mouseX - 35, mouseY - 15, mouseX - 25, mouseY - 2);
    }
    else {
      triangle(mouseX - 25, mouseY + 10, mouseX - 35, mouseY + 12, mouseX - 25, mouseY + 2);
      triangle(mouseX - 25, mouseY + 7, mouseX - 40, mouseY + 7, mouseX - 25, mouseY);
      triangle(mouseX - 25, mouseY, mouseX - 43, mouseY + 2, mouseX - 25, mouseY - 4);
      triangle(mouseX - 25, mouseY - 7, mouseX - 47, mouseY - 3, mouseX - 25, mouseY - 3);
      triangle(mouseX - 25, mouseY - 10, mouseX - 35, mouseY - 17, mouseX - 25, mouseY - 2);
    }


    strokeWeight(2);
    stroke(255);
    for (int i = 0; i < height; i++) {
      point(random(0, width), random(0, height));
    }
  }
}

