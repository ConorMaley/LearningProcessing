//Conor Maley
//Made this in 2014
//random world generator

int xMax = 80;
int yMax = 50;
int[][] coordinates;
int coordSize = 10;
int x=23; // x and y are initalized to starting point
int y=39;
int rand=0;
int level=50;
int stopper=0;
int counter=0;
int water=-1; //when negative, land, when positive, water

boolean stopall = true;

void setup() {
  coordinates=new int[xMax][yMax];
  background(255);
  //size(xMax * 10, yMax * 10);
  size(800, 500);
  
  x = int(random(0, xMax));
  y = int(random(0, yMax));
  rand = 0;
  level = int(random(0, 100));
  counter = 0;
  stopper = 0;
  water = -1;
  
  stopall = true;
  
  for (int i =0; i<width; i=i+10) {
    for (int n=height; n>0; n=n-10) {
      //line(i, 0, i, height);
      //line(0, n, width, n);
    }
  }
  for (int i=0; i<xMax; i++) {
    for (int w=0; w<yMax; w++) {
      coordinates[i][w]=-1;
    }
  }
}

void draw() {
  if(stopall) {
  for (int q = 0; q < 40; q++) {
    rand=int(random(1, 5));
    changecoordinate();
    adjustcoordinatelvl();
    coordinates[x][y]=level;
    colorcoodrinate();
    counter++;
    if (counter>20000) {
      for (int i=0; i<xMax; i++) {
        for (int w=0; w<yMax; w++) {
          if (coordinates[i][w]==-1) {
            stroke(0,0,255);
            fill(0, 0, 255);
            rect(i*coordSize, w*coordSize, coordSize, coordSize);
          }
        }
      }
      stopall = false;
    }
  }
  }
}

void colorcoodrinate() { //clean this up perhaps??
  if (water<0) {
    if (level<=15) {
      stroke(230, 225, 72);
      fill(230, 225, 72);
    }
    if (level>16 && level<=40) {
      stroke(115, 237, 3);
      fill(115, 237, 3);
    }
    if (level>41 && level<=75) {
      stroke(66, 198, 47);
      fill(66, 198, 47);
    }
    if (level>76 && level<=100) {
      stroke(0, 255, 0);
      fill(0, 255, 0);
    }
  } else if (water>0) {
    stroke(0, 0, 255);
    fill(0, 0, 255);
    //      colorMode(HSB);
    //      fill(150, 240, 255);
    colorMode(RGB);
  }
  rect(x*coordSize, y*coordSize, coordSize, coordSize);
}

void changecoordinate() {
  randomcoord();
  //  while (coordinates[x][y] >= 0) {
  //    rand=rand+25;
  //    if (rand>100) {
  //      rand=rand-100;
  //    }
  //    counter++;
  //    randomcoord();
  //    if(counter>4) {
  //      coordinates[x][y] = 1;
  //    }
  //  }
  //  counter=0;

  if (coordinates[x][y] >= 0) {
    rand=rand+50;
    if (rand>=100) {
      rand=rand-100;
    }
    randomcoord();
  }
}

void randomcoord() {
  if (rand == 1) {
    x++;
    if (x>xMax-1) { //bounds check
      x--;
    }
  }
  if (rand == 2) {
    y--;
    if (y<0) { //bounds check
      y++;
    }
  }
  if (rand == 3) { 
    x--;
    if (x<0) { //bounds check
      x++;
    }
  }
  if (rand == 4) { 
    y++;
    if (y>yMax-1) { //bounds check
      y--;
    }
  }
}

void adjustcoordinatelvl() {
  if (water<0) {
    rand=int(random(0, 110));
    for (int i = 1; i<= 11; i++) {
      if (stopper ==0) {
        if (rand<=i*10) {
          i=i-6;
          level=level+i;
          stopper=1;
          if (level<0) {
            level=0;
          }
          if (level>100) {
            level=100;
          }
        }
      }
    }
    stopper=0;
  }
  if (level>15) {
    rand=int(random(0, 1000));
    if (rand<1) {
      water*=-1;
    }
  }
}

void mousePressed() {
  setup();
}