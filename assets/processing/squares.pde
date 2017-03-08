void setup(){
  size(350, 350);
background(0);
smooth();
}


void draw()
{
for(int i = 0; i < width; i= i + 30) {
  for(int x = 0; x < width; x = x + 30) {
  fill(i, i, x);
  rect(i, x, 20, 20); 
  rect(x, i, 20, 20); 
    }
  }
  }






