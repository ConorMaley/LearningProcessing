
int red=0;
int green=0;
int blue=0;
int seq =0;

void setup() {
  size(640, 480);
  background(255);
  rectMode(CENTER);
}

void draw() {
  /*
First: determine seq #
   */
  if (red ==255) {
    seq=1;
  }
  if (seq==1 && green==255) {
    seq=2;
  }
  if (seq==2 && blue==255) {
    seq=3;
  }
  if (seq==3 && red==0) {
    seq=4;
  }
  if (seq==4 && green==0) {
    seq=5;
  }
  if (seq==5 && blue==0) {
    seq=0;
  }  

  /*
Second: draw
   */

  for (int i=0; i<6; i++) {
    if (seq==i) {
      changecolor(i);
    }
  }
    fill(red, green, blue);
    stroke(red, green, blue);
    
    for(int w=0; w<10; w++) { //draw specific number of rectangles at a time
    rect(int(random(0, 640)), int(random(0, 480)), int(random(1, 50)), int(random(1, 50)));
    }
}

void changecolor(int sequence) {
  if (seq==0) {
    red++;
  }
  if (seq==1) {
    green++;
  }
  if (seq==2) {
    blue++;
  }
  if (seq==3) {
    red--;
  }
  if (seq==4) {
    green--;
  }
  if (seq==5) {
    blue--;
  }
}

