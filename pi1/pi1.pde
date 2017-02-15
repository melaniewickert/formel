import processing.io.*;
int emptyColor = 255;
int Feeder = 26;
IntList pastr;
int r = (int) random(1,3);
boolean good = true;
boolean record = true;
int startT = 42;
int stopT = startT + 1;
int startC = 40;
int stopC = startC + 10;

void setup() {
  fullScreen();
  noCursor();
  background(emptyColor);
  noStroke();
  fill(0);
  GPIO.pinMode(Feeder, GPIO.OUTPUT);
  GPIO.digitalWrite(Feeder, true);
  pastr = new IntList();
  pastr.append(r);
}

public int updater(){
  int newr = (int) random(1,3);
  good = false;
  print(pastr.size());
  if(pastr.size()<3){good=true;}
  do{
      //if(pastr.size()<3){good=true;}
      newr = (int) random(1,3);
      if (newr==pastr.get(pastr.size()-1) && newr==pastr.get(pastr.size()-2) && newr==pastr.get(pastr.size()-3))
        good = false;
      else
        good = true;
      
  }
  while(!good);
  return newr;
}

void record() {
  if (record ==true){
  launch("goproon.sh");
  record = false;
  }
  
  else {
  }
}

void draw() {
  background(emptyColor);
  int d = day();
  int h = hour();
  int m = minute();
  int s = second();
  
  if (h >= 0 && h < 7){
    background(0);
  }
  
  if (h >= 19){
    background(0);
  }
  
  if ((d >= 16 && d <= 18) && (h == 9 || h == 16)){
    if (m >= 49 && m <= 59){
      record();
    }
    if (m == 50 && s >= 0){
      GPIO.digitalWrite(Feeder, false);
    }
    if (m == 50 && s > 30){
      GPIO.digitalWrite(Feeder, true);
    }
  }
  
  /**if ((d >= 15 && d <= 17) && (h == 11 || h == 13)){
    if (m >= 40 && m <= 50){
      record();
    }
    if (m == 41 && s >= 0){
      GPIO.digitalWrite(Feeder, false);
    }
    if (m == 41 && s > 30){
      GPIO.digitalWrite(Feeder, true);
    }
  }*/
  
  
  if ((d >= 19) && (h == 8|| h == 11|| h == 14|| h == 17)) {
    if (m >= startC && m <= stopC) {
      record();
    }
    if ((m >= startT && m < stopT)){
      good = false;
      if (r == 1) {
        if (s >= 0 && s <= 5) {
          drawImage1();
        }
        if (s >= 9 && s < 15) {
          //print ("it is here");
          GPIO.digitalWrite(Feeder, false);
        }
        if (s > 30) {
          //print ("is it here?");
          GPIO.digitalWrite(Feeder, true);
        }
      }
      else {
        if (r == 2) {
          if ((s >= 0 && s <= 5)) {
            drawImage2();
          }
        }
      }
    }
  
  else {
   if (good==false){
      record = true;
      r = updater();
      pastr.append(r);
      print(pastr);
    }
    else{
    }
  }
  }
}


void drawImage1() {
  rect(width*0, 0, width*0.05, height);
  rect(width*0.1, 0, width*0.05, height); 
  rect(width*0.2, 0, width*0.05, height);
  rect(width*0.3, 0, width*0.05, height);
  rect(width*0.4, 0, width*0.05, height);
  rect(width*0.5, 0, width*0.05, height);
  rect(width*0.6, 0, width*0.05, height); 
  rect(width*0.7, 0, width*0.05, height);  
  rect(width*0.8, 0, width*0.05, height); 
  rect(width*0.9, 0, width*0.05, height);
}

void drawImage2() {
  rect(0, height*0, width, height*0.07);
  rect(0, height*0.15, width, height*0.07);
  rect(0, height*0.3, width, height*0.07);
  rect(0, height*0.45, width, height*0.07);
  rect(0, height*0.6, width, height*0.07);
  rect(0, height*0.75, width, height*0.07);
  rect(0, height*0.9, width, height*0.07);
}