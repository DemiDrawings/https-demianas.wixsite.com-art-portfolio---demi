//In this exercise, I wanted to create an existential game featuring an elevator that traveled through all of time and space. In a sense, this place can be thought of as purgatory,
//though it truly is so expansive that there is no set definition or capacity. If I could actually develop and spend more time on this game, I think it would be really cool if
//there were more stops and characters who came into the elevator, each with their own unique personality and life advice or philosophical standpoint.

//The Ferryman is your 'escort' through purgatory, and his lore has still to be uncovered. He is quite cynical as he is sassy.

// Sound effects belong to Toby Fox & other unknown artists

import processing.sound. *;
SoundFile file;
SoundFile ding;
SoundFile clink;
SoundFile drop;
SoundFile win;
SoundFile kill;
//BACKGROUNDS

PImage [] glitch = new PImage[7];
int currentI_glitch_image = 0;
PImage [] tavern = new PImage[21]; // First image
int currentI_tavern_image = 0;
PImage elevator;//Second image
PImage title;
PImage[] elf = new PImage[31];
int currentI_elf_image = 0;
int timedelay = 50;
int nextTime;
PFont one; // First font

//TEXT STRING
String txt = "You arrive at The End, what many from your dimension may recall as a tavern. \n Perhaps this may give insights on how you ended up here...Or maybe you just need to really lay off the drinks. \n Either way, you're here. As much calamity as there may be in uncertainty, it may also be your greatest source of peace. \n We may be able to derive insights from our past experiences, but there is something so freeing in knowing \n we do not know what is going to happen. No one season is like the last, so, let's just try and believe in whatever is ahead.";
String txt2 = "Greetings, traveler. Are you lost?";
String txt3 = "Where are you? Who knows. We're in an elevator, I can tell you that much. \n Well, a mechanism you would understand as an 'elevator'. Where will you go next and end up? Only you will know. ";
String txt4 = "We usually call this an 'existential crisis'. Not to fret. I'm sure you'll come to some conclusive answer eventually. \n Or not. Does it really matter in the End? We are intricate beings, I can tell you that much. ";
String txt5 = "Yes, it is. I'm glad to have met such a like-minded vessel. It's all we can do sometimes. \n Keep going. The worst nightmares have been realized, and even you, sole traveler of this world, have so much more to discover. \n Nonetheless, it appears we grow close the next floor. Your plan?";
String txt6= "Oh? Well, it will be nice to have some company on our journey. It is completely valid and neccessary to take rest sometimes, and take delight in all that is around you. \n What would be the point if we didn't pause and reflect or enjoy the present? What would be the point if you didn't struggle or grieve over what may no longer be here? \n Does your care and love for these things not show it has impact and meaning? I don't think moving forward means forgetting or letting go of your feelings \n Rather, it is understanding it will always be with you. If you must stop and take it all in every once in awhile or just take a moment, I hope you know that is entirely okay.";
String txt7= "I'm nearly just as clueless as you. Well, maybe that was a lie. I am not nearly as asinine. \n Sorry, that was a rather distasteful joke. Maybe I am not really sorry. Maybe I am just sorry for you. \n You can derive whatever purpose or meaning you want. Nonetheless, it appears we grow close to the next floor. Your plan?";
String txt8= "\n What in the actual F#CK do you think you are doing? \n Am I a joke to you? Oh, I see, so this is all just a fun game to you, huh? \n YOU DON'T THINK I HAVEN'T BROKEN THE FOURTH F#CKING WALL?";


//FIRST SET
int screen = 1;
float alpha = 100;

//COLORS
int purple= (#7700C8);

float rx0 = 400;
float ry0 = 525;
float rw0 = 500;
float rh0 = 120;

float rx = 125;
float ry = 300;
float rw = 500;
float rh = 120;

float rx2= 775;
float ry2= 300;
float rw2= 500;
float rh2= 120;

//SECOND SET
float rx3= 125;
float ry3= 300;
float rw3= 500;
float rh3= 120;

float rx4= 775;
float ry4= 300;
float rw4= 500;
float rh4= 120;

//THIRD SET
float rx5= 125;
float ry5= 300;
float rw5= 500;
float rh5= 120;

float rx6= 775;
float ry6= 300;
float rw6= 500;
float rh6= 120;

//FOURTH SET
float rx7= 125;
float ry7= 300;
float rw7= 500;
float rh7= 120;

float rx8= 775;
float ry8= 300;
float rw8= 500;
float rh8= 120;

//FIFTH SET
float rx9= 125;
float ry9= 300;
float rw9= 500;
float rh9= 120;

float rx10= 775;
float ry10= 300;
float rw10= 500;
float rh10= 120;

//SIXTH SET
float rx11= 125;
float ry11= 300;
float rw11= 500;
float rh11= 120;

float rx12= 775;
float ry12= 300;
float rw12= 500;
float rh12= 120;

//SEVENTH SET
float rx13= 125;
float ry13= 300;
float rw13= 500;
float rh13= 120;

float rx14= 775;
float ry14= 300;
float rw14= 500;
float rh14= 120;

//EIGHTH SET (SPECIAL THIRD OPTION)
float rx15= 450;
float ry15 = 100;
float rw15 = 500;
float rh15 = 120;

float rx16 = 775;
float ry16 = 300;
float rw16 = 500;
float rh16= 120;

//NINTH SET
float rx17= 125;
float ry17 = 300;
float rw17 = 500;
float rh17 = 120;

float rx18 = 775;
float ry18 = 300;
float rw18 = 500;
float rh18= 120;

//textbox
int tl=1000; //length
int th = 260; //height

//tb location
int tx = 200;
int ty = 500;

PFont start;

void setup () {
  fullScreen();
  background(0);
  imageMode(CENTER);

  //IMAGES
  elevator=loadImage("elevator.png");
  title=loadImage("title.png");

  start = createFont("ShadowsIntoLight-Regular.ttf", 54);
  textFont(start); // font of text
  textSize(54); // size of text
  textLeading(50); // this spaces out text

  //SOUNDS
  ding = new SoundFile(this, "ding.mp3"); // Elevator ding
  ding.play();
  file = new SoundFile(this, "DELT.mp3"); // Elevator music
  file.loop();
  clink = new SoundFile(this, "clink.mp3"); // drink clink
  drop= new SoundFile(this, "drop.mp3"); // button
  win = new SoundFile(this, "win.mp3");
  kill = new SoundFile(this, "kill.mp3");

  frameRate(10);
  for (int i = 0; i < elf.length; i++) {
    elf[i] = loadImage("elf" + nf(i+1, 2) + ".gif");
  }
  for (int i = 0; i < tavern.length; i++) {
    tavern[i] = loadImage("tavern" + nf(i+1, 2) + ".gif");
  }
  for (int i = 0; i < glitch.length; i++) {
    glitch[i] = loadImage("glitch" + nf(i+1, 2) + ".png");
  }
}

void draw() {
  background(#212121); //Black
  if (screen == 1) {
    drawScreen1();
  } else if (screen == 2) {
    drawScreen2();
  } else if (screen == 3) {
    drawScreen3();
  } else if (screen == 4) {
    drawScreen4();
  } else if (screen == 5) {
    drawScreen5();
  } else if (screen == 6) {
    drawScreen6();
  } else if (screen == 7) {
    drawScreen7();
  } else if (screen==8) {
    drawScreen8();
  } else if (screen ==9) {
    drawScreen9();
  }
}
void drawScreen1() {
  imageMode(CENTER);
  image(title, width/2, height/2, width, height);

  //SCREEN 1
  if (overRect(rx0, ry0, rw0, rh0) == true) {
    fill(purple, alpha);
  } else {
    fill(purple);
  }
  stroke(255);
  rect(rx0, ry0, rw0, rh0);
  fill(255);
  textSize(50);
  text("Start", 600, 600);
}
void drawScreen2() {
  if (millis() > nextTime) {
    currentI_elf_image++;
    if (currentI_elf_image >= elf.length) {
      currentI_elf_image = 0;
    }
    nextTime = millis() + timedelay;
  }

  imageMode(CENTER);
  image(elf[currentI_elf_image], width/2, height/2, width, height);
  textbox();
  tag();
  //SCREEN 1, First Option
  if (overRect(rx, ry, rw, rh) == true) {
    fill(purple, alpha);
  } else {
    fill(purple);
  }
  stroke(255);
  rect(rx, ry, rw, rh);
  {
  }
  //SCREEN 1, Second Option
  if (overRect(rx2, ry2, rw2, rh2) == true) {
    fill(purple, alpha);
  } else {
    fill(purple);
  }
  stroke(255);
  rect(rx2, ry2, rw2, rh2);
  fill(255);
  textSize(50);
  text(txt2, 415, 650);
  textSize(35);
  text("What am I?", 940, 365);
  text("Where am I?", 300, 365);
}

void drawScreen3() {
  if (millis() > nextTime) {
    currentI_elf_image++;
    if (currentI_elf_image >= elf.length) {
      currentI_elf_image = 0;
    }
    nextTime = millis() + timedelay;
  }

  imageMode(CENTER);
  image(elf[currentI_elf_image], width/2, height/2, width, height);
  if (overRect(rx3, ry3, rw3, rh3) == true) {
    fill(purple, alpha);
  } else {
    fill(purple);
  }
  stroke(255);
  rect(rx3, ry3, rw3, rh3);
  //OPTION 2
  if (overRect(rx4, ry4, rw4, rh4) == true) {
    fill(purple, alpha);
  } else {
    fill(purple);
  }
  stroke(255);
  rect(rx4, ry4, rw4, rh4);
  textbox();
  tag();
  fill(255);
  textSize(20);
  text(txt3, 225, 595);
  text("Seriously, what the Hell is going on?", 940, 365);
  text("Philosophical.", 250, 365);
}

void drawScreen4() {
  if (millis() > nextTime) {
    currentI_elf_image++;
    if (currentI_elf_image >= elf.length) {
      currentI_elf_image = 0;
    }
    nextTime = millis() + timedelay;
  }

  imageMode(CENTER);
  image(elf[currentI_elf_image], width/2, height/2, width, height);
  if (overRect(rx5, ry5, rw5, rh5) == true) {
    fill(purple, alpha);
  } else {
    fill(purple);
  }
  stroke(255);
  rect(rx5, ry5, rw5, rh5);
  //OPTION 2
  if (overRect(rx6, ry6, rw6, rh6) == true) {
    fill(purple, alpha);
  } else {
    fill(purple);
  }
  stroke(255);
  rect(rx6, ry6, rw6, rh6);
  textbox();
  tag();
  fill(255);
  textSize(20);
  text(txt4, 225, 595);
  text("Seriously, what the Hell is going on?", 940, 365);
  text("Philosophical.", 250, 365);
}

void drawScreen5() { //PHILOSOPHICAL ROUTE
  if (millis() > nextTime) {
    currentI_elf_image++;
    if (currentI_elf_image >= elf.length) {
      currentI_elf_image = 0;
    }
    nextTime = millis() + timedelay;
  }

  imageMode(CENTER);
  image(elf[currentI_elf_image], width/2, height/2, width, height);
  if (overRect(rx7, ry7, rw7, rh7) == true) {
    fill(purple, alpha);
  } else {
    fill(purple);
  }
  stroke(255);
  rect(rx7, ry7, rw7, rh7);

  //OPTION 2

  if (overRect(rx15, ry15, rw15, rh15) == true) {
    fill(purple, alpha);
  } else {
    fill(purple);
  }
  stroke(255);
  rect(rx15, ry15, rw15, rh15);

  //OPTION 3

  if (overRect(rx8, ry8, rw8, rh8) == true) {
    fill(purple, alpha);
  } else {
    fill(purple);
  }
  stroke(255);
  rect(rx8, ry8, rw8, rh8);

  textbox();
  tag();
  fill(255);
  textSize(20);
  text(txt5, 225, 595);
  text("Stay on elevator", 940, 360);
  text("Get off next floor", 250, 365);
  text("Press all elevator buttons", 600, 165);
}

void drawScreen6() { //WHAT THE HELL IS GOING ON ROUTE
  if (millis() > nextTime) {
    currentI_elf_image++;
    if (currentI_elf_image >= elf.length) {
      currentI_elf_image = 0;
    }
    nextTime = millis() + timedelay;
  }

  imageMode(CENTER);
  image(elf[currentI_elf_image], width/2, height/2, width, height);
  if (overRect(rx9, ry9, rw9, rh9) == true) {
    fill(purple, alpha);
  } else {
    fill(purple);
  }
  stroke(255);
  rect(rx9, ry9, rw9, rh9);
  //OPTION 2
  if (overRect(rx10, ry10, rw10, rh10) == true) {
    fill(purple, alpha);
  } else {
    fill(purple);
  }
  stroke(255);
  rect(rx10, ry10, rw10, rh10);

  //OPTION 3
  if (overRect(rx15, ry15, rw15, rh15) == true) {
    fill(purple, alpha);
  } else {
    fill(purple);
  }
  stroke(255);
  rect(rx15, ry15, rw15, rh15);

  textbox();
  tag();
  fill(255);
  textSize(20);
  text(txt7, 225, 595);
  text("Stay on elevator", 940, 360);
  text("Get off next floor", 250, 365);
  text("Press all elevator buttons", 600, 165);
}

void drawScreen7() {
  if (millis() > nextTime) {
    currentI_elf_image++;
    if (currentI_elf_image >= elf.length) {
      currentI_elf_image = 0;
    }
    nextTime = millis() + timedelay;
  }

  imageMode(CENTER);
  image(elf[currentI_elf_image], width/2, height/2, width, height);
  textbox();
  tag2();
  fill(255);
  textSize(15);
  text(txt6, 225, 595);
}

void drawScreen8() {
  if (millis() > nextTime) {
    currentI_tavern_image++;
    if (currentI_tavern_image >= tavern.length) {
      currentI_tavern_image = 0;
    }
    nextTime = millis() + timedelay;
  }

  imageMode(CENTER);
  image(tavern[currentI_tavern_image], width/2, height/2, width, height);
  textbox();
  fill(255);
  textSize(20);
  text(txt, 225, 555);
}

void drawScreen9() {

  if (millis() > nextTime) {
    currentI_glitch_image++;
    if (currentI_glitch_image >= glitch.length) {
      currentI_glitch_image = 0;
    }
    nextTime = millis() + timedelay;
  }

  imageMode(CENTER);
  image(glitch[currentI_glitch_image], width/2, height/2, width, height);
    if (overRect(rx5, ry5, rw5, rh5) == true) {
    fill(purple, alpha);
  } else {
    fill(purple);
  }
  stroke(255);
  rect(rx5, ry5, rw5, rh5);
  //OPTION 2
  if (overRect(rx6, ry6, rw6, rh6) == true) {
    fill(purple, alpha);
  } else {
    fill(purple);
  }
  stroke(255);
  rect(rx6, ry6, rw6, rh6);
  
  textbox();
  tag();
  fill(255);
  textSize(30);
  text(txt8, 255, 555);
   text("I'm sorry!", 940, 360);
  text("Woah, this is some cool photoshopping!", 200, 365);
}

class Textbox {

  float x= CENTER;
  float y= CENTER;
  float w = 100 ;
  float h = 100;
}

void mousePressed() {
  if (screen == 1) {
    if (overRect(rx0, ry0, rw0, rh0) == true) { //OPTION ONE
      screen = 2;
      println("go to screen 2");
      drop.play();
    }
  } else if (screen == 2) {
    if (overRect(rx, ry, rw, rh) == true) { //OPTION ONE
      screen = 3;
      println("go to screen 3");
      drop.play();
    }
    if (overRect(rx2, ry2, rw2, rh2) == true) {
      screen = 4;
      println("go to screen 4");
      drop.play();
    }
  } else if (screen ==3) {
    if (overRect(rx3, ry3, rw3, rh3) == true) {
      screen = 5;
      println("got to screen 5");
      drop.play();
    }
    if (overRect(rx4, ry4, rw4, rh4) == true) {
      screen = 6;
      println("go to screen 6");
      drop.play();
    }
  } else if (screen ==4) {
    if (overRect(rx5, ry5, rw5, rh5) == true) {
      screen = 5;
      println("go to screen 5");
      drop.play();
    }
    if (overRect(rx6, ry6, rw6, rh6) == true) {
      screen = 6;
      println("go to screen 6");
      drop.play();
    }
  } else if (screen ==5) {
    if (overRect(rx7, ry7, rw7, rh7) == true) {
      screen = 8;
      println("go to screen 8");
      clink.play();
    }
    if (overRect(rx8, ry8, rw8, rh8) == true) {
      screen=7;
      println("go to screen 7");
      win.play();
    }
    if (overRect(rx15, ry15, rw15, rh15) == true) {
      screen= 9;
      println("go to screen 9");
    }
  } else if (screen ==6) {
    if (overRect(rx9, ry9, rw9, rh9) == true) {
      screen=8;
      println("go to screen 8");
      clink.play();
    }
    if (overRect(rx10, ry10, rw10, rh10) == true) {
      screen=7;
      println("go to screen 7");
      win.play();
    }
    if (overRect(rx15, ry15, rw15, rh15) == true) {
      screen= 9;
      println("go to screen 9");
      kill.play();
    }
  } else if (screen ==7) {
    if (mousePressed==true) {
      screen=1;

    }
  } else if (screen == 8) {
    if (mousePressed==true) {
      screen=1;
    }
  } else if (screen == 9) {
    if (overRect(rx5, ry5, rw5, rh5) == true) {
      screen = 6;
      println("go to screen 6");
      drop.play();
    }
    if (overRect(rx6, ry6, rw6, rh6) == true) {
      screen = 6;
      println("go to screen 6");
      drop.play();
    }
  }
}

boolean overRect(float x, float y, float w, float h) {
  // If the (x,y) are inside the rect, return 'true'
  if (mouseX > x && mouseX < x+w &&
    mouseY > y && mouseY < y+h) {
    return true;
  } else {
    return false;
  }
}
void textbox() {
  fill(0, alpha);
  rect(tx, ty, tl, th);
}

void tag() {
  fill(0);
  rect(120, 495, 240, 70);
  textSize(30);
  fill(247, 244, 225, 240);
  text("???", 220, 545);
}

void tag2() {
  fill(0);
  rect(120, 495, 240, 70);
  textSize(30);
  fill(247, 244, 225, 240);
  text("Ferryman", 185, 540);
}
