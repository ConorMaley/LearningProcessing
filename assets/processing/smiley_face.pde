void setup()
{
  size(500, 500);
  background(255);
}

void draw()
{
  smooth();
  stroke(0);
  fill(255);
  ellipse(150, 100, 55, 50);
  ellipse(350, 100, 55, 50);
  fill(0, 0, 255);
  ellipse(150, 100, 20, 20);
  ellipse(350, 100, 20, 20);
  fill(0);
  triangle(225, 200, 210, 240, 240, 240);
  fill(255);
  stroke(255, 10, 10);

  if (mousePressed == true) {

    curve(150, 300, 200, 350, 250, 350, 300, 300);
  }
  else {
    curve(150, 400, 200, 350, 250, 350, 300, 300);
  }
}
