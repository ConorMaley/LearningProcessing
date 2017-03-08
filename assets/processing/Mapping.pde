//Maybe add elevation?



int[][] coordinates;
int x=0;
int y=0;
int rand=0;
int level=50;
int stopper=0;
int counter=0;
int water=-1; //when negative, land, when positive, water
boolean waiter;

void setup() {
  coordinates=new int[40][40];
  background(255);
  size(400, 400);
  waiter = true;
  x = 0;
  y = 0;
  rand = 0;
  stopper = 0;
  counter = 0;
  water = -1;
  //  for (int i =0; i<400; i=i+10) {
  //    for (int n=400; n>0; n=n-10) {
  //      line(i, 0, i, 400);
  //      line(0, n, 400, n);
  //    }
  //  }
  //  for (int i=0; i<40; i++) {
  //    for (int w=0; w<40; w++) {
  //      coordinates[i][w]=-1;
  //    }
  //  }
  rect(x*10, y*10, 10, 10);
  level=int(random(0, 100));
  colorcoodrinate();
}

void draw() {
  if (waiter) {
    for (int i=0; i<39; i++) {
      rand=int(random(0, 100));
      changecoordinate();
      adjustcoordinatelvl();
      coordinates[x][y]=level;
      colorcoodrinate();
    }
  }
}

void colorcoodrinate() {
  if (water<0) {
    if (level<=15) {
      fill(230, 225, 72);
      stroke(230, 225, 72);
    }
    if (level>16 && level<=30) {
      //fill(115, 237, 3);
      fill(150, 200, 60);
      stroke(150, 200, 60);
    }
    if (level>31 && level<=44) {
      fill(30, 175, 30);
      stroke(30, 175, 30);
    }
    if (level>45 && level<=50) {
      fill(0, 200, 0);
      stroke(0, 200, 0);
    }
    if (level>50 && level<=75) {
      fill(0, 0, 255);
      stroke(0, 0, 255);
    }
    if (level>75 && level<=80) {
      fill(0, 200, 0);
      stroke(0, 200, 0);
    }
    if (level>80 && level<=100) {
      fill(35, 225, 35);
      stroke(35, 225, 35);
    }
  } else if (water>0) {
    fill(0, 0, 255);
    //      colorMode(HSB);
    //      fill(150, 240, 255);
    colorMode(RGB);
  }
  rect(x*10, y*10, 10, 10);
}

void changecoordinate() {
  x++;
  if (x>39) {
    x=0;
    if (y!=39) {
      y++;
    } else {
      waiter = false;
    }
  }
}

void randomcoord() {
  if (rand<=25) {
    x++;
    if (x>39) {
      x--;
    }
  }
  if (rand>25 && rand<=50) {
    y--;
    if (y<0) {
      y++;
    }
  }
  if (rand>50 && rand<=75) {
    x--;
    if (x<0) {
      x++;
    }
  }
  if (rand>75 && rand<=100) {
    y++;
    if (y>39) {
      y--;
    }
  }
}

void adjustcoordinatelvl() {
  if (rand < 50) {
    checkuppercoord();
  } else {
    checkleftcoord();
  }
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

void checkuppercoord() {
  if (y!=0) {
    level=coordinates[x][y-1];
  } else {
    level=50;
  }
}

void checkleftcoord() {
  if (x!=0) {
    level=coordinates[x-1][y];
  } else {
    level=50;
  }
}

void mousePressed() {
  setup();
}