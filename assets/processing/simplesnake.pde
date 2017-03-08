//snake game
//By: Conor Maley
//---------------PROBLEMS---------------------//
//differentiate snake and food colors
//--------------------------------------------//
int speed=100;//"slows down" the game
int snakeheadx=150;
int snakeheady=150;
int snakesize=10; //snakewidth
int dx=0; // snake x-movement
int dy=0; // snake y-movement
int foodx=20; //food x-location
int foody=20; //food y-location
int bodycount=1; // number of bodies
int []snakesx; // snake array list X
int []snakesy; // snake array list Y
int bodycountqueue=0;
int keyfix = 0;
int lvlfnct;

boolean levelchosen=true;

//key fix Zach Rothberg
int prevent = 0; //prevents pushing wrong arrow



void setup() {
  size(300, 300);
  snakesx = new int[900]; //900 because the playing field is 30 by 30.
  // ^^ -- lololol negative on that one 2012 Conor. 
  snakesy = new int[900];
  frameRate(60);
  speed=1;
  background(0);
  noSmooth();
  stroke(255);
}

void draw() {
  if (levelchosen) {
    chooselevel();
  } else {


    if (speed%lvlfnct == 0) { //make modulus number smaller to increase speed; 10=slow; 3=intense.

      keyfix=0;

      background(0);

      if (bodycountqueue>0) { //basically this makes the adding of bodies cleaner
        bodycount++;
        //println(bodycount);
        bodycountqueue--;
      }


      if (snakeheadx==foodx && snakeheady==foody) { //eating interface
        drawfood();
        bodycountqueue+=2; //if you change this number, you will change how many bodies are added per food
      }

      fill(255, 0, 0);
      rect(snakeheadx, snakeheady, snakesize, snakesize);//snake head

      fill(0, 0, 255);
      rect(foodx, foody, snakesize, snakesize);//food, same size as snake

        if (snakeheadx>=width || snakeheadx<0 || snakeheady >=height || snakeheady<0) {
        gameover();
      }

      for (int i =1; i <bodycount; i++) { //checks if snake eats itself
        if (snakeheadx ==snakesx[i] && snakeheady==snakesy[i]) {
          gameover();
        }
      }

      for (int i = 0; i<bodycount; i++) {
        int x = snakesx[i];
        int y = snakesy[i];
        fill(255, 0, 0);
        rect(x, y, snakesize, snakesize);
      }

      for (int i = bodycount; i >0; i--) {
        snakesx[i] = snakesx[i-1];
        snakesy[i] = snakesy[i-1];
      }

      snakeheadx+=dx;
      snakeheady+=dy;
      snakesx[0]=snakeheadx;
      snakesy[0]=snakeheady;
    }

    speed++;
  }
}

void chooselevel() {
  background(255);
  fill(0);
  textSize(12);
  text("Please use your keypad to choose a level (1-9)", 20, 20);
  //if (keyPressed == true) {
  //  if (key == '1') {
  //    lvlfnct=10-1;
  //    levelchosen=false;
  //  }
  //  if (key == '2') {
  //    lvlfnct=10-2;
  //    levelchosen=false;
  //  }
  //  if (key == '3') {
  //    lvlfnct=10-3;
  //    levelchosen=false;
  //  }
  //  if (key == '4') {
  //    lvlfnct=10-4;
  //    levelchosen=false;
  //  }
  //  if (key == '5') {
  //    lvlfnct=10-5;
  //    levelchosen=false;
  //  }
  //  if (key == '6') {
  //    lvlfnct=10-6;
  //    levelchosen=false;
  //  }
  //  if (key == '7') {
  //    lvlfnct=10-7;
  //    levelchosen=false;
  //  }
  //  if (key == '8') {
  //    lvlfnct=10-8;
  //    levelchosen=false;
  //  }
  //  if (key == '9') {
  //    lvlfnct=10-9;
  //    levelchosen=false;
  //  }
    
    //    for (int i = 1; i<=9; i++) {
    //      if (key == i) {
    //        lvlfnct=i-10;
    //        i=10;
    //        levelchosen=false;
    //      }
    //    }
  //}
}

void drawfood() {
  int x = (int)random(1, 30);//only between 1 and 30 so the food can be on intervals
  int y = (int)random(1, 30);
  foodx = x*10;
  foody = y*10;
}


void keyPressed() {
  if (levelchosen) {
    if (key == '1') {
      lvlfnct=10-1;
      levelchosen=false;
    }
    if (key == '2') {
      lvlfnct=10-2;
      levelchosen=false;
    }
    if (key == '3') {
      lvlfnct=10-3;
      levelchosen=false;
    }
    if (key == '4') {
      lvlfnct=10-4;
      levelchosen=false;
    }
    if (key == '5') {
      lvlfnct=10-5;
      levelchosen=false;
    }
    if (key == '6') {
      lvlfnct=10-6;
      levelchosen=false;
    }
    if (key == '7') {
      lvlfnct=10-7;
      levelchosen=false;
    }
    if (key == '8') {
      lvlfnct=10-8;
      levelchosen=false;
    }
    if (key == '9') {
      lvlfnct=10-9;
      levelchosen=false;
    }
    //for (int i = 1; i<=9; i++) {
    //  char check = char(i);
    //  if (key == check) {
    //    println("here");
    //    lvlfnct=i-10;
    //    i=10;
    //    levelchosen=false;
    //  }
    //}
  } else {
    if (keyfix==0) {
      keyfix=1;
      if (key == CODED) {
        if (bodycount > 1) //prevents if body count is more then 1
        {
          if (keyCode == UP && prevent != 2) {
            dy=-10;
            dx=0;
            prevent = 1;
          } else if (keyCode == DOWN && prevent != 1) {
            dy=10;
            dx=0;
            prevent = 2;
          } else if (keyCode == RIGHT && prevent != 4) {
            dx=10;
            dy=0;
            prevent = 3;
          } else if (keyCode == LEFT && prevent !=3) {
            dx=-10;
            dy=0;
            prevent = 4;
          }
        } else //does not otherwise
        {
          if (keyCode == UP) 
          {
            dy=-10;
            dx=0;
            prevent = 1;
          } else if (keyCode == DOWN)
          {
            dy=10;
            dx=0;
            prevent = 2;
          } else if (keyCode == RIGHT)
          {
            dx=10;
            dy=0;
            prevent = 3;
          } else if (keyCode == LEFT) 
          {
            dx=-10;
            dy=0;
            prevent = 4;
          }
        }
      }
      if (key == ' ') {//reset key
        snakeheadx=140;
        snakeheady=140;
        dx=0;
        dy=0;
        bodycount=1;
        levelchosen=true;
      }
    }
  }
}

void gameover() {
  dx=0;
  dy=0;
  background(200, 20, 20);
  fill(0);
  textSize(24);
  text("GAME OVER", 50, 50);
  textSize(14);
  text("(press space to restart)", 130, 150);
}