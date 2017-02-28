import processing.io.*;
int emptyColor = 255;
int Feeder = 26;
int Light = 16;
IntList pastr;
int r = (int) random(1,3);
boolean good = true;
boolean record = true;
int startT = 25; // in minutes
int stopT = startT + 5; //runs for 5 minutes

void setup() {
  size (400, 400); //fullScreen();
  noCursor();
  background(emptyColor);
  noStroke();
  fill(0);
  GPIO.pinMode(Feeder, GPIO.OUTPUT);
  GPIO.pinMode(Light, GPIO.OUTPUT);
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
      newr = (int) random(1,3);
      if (newr==pastr.get(pastr.size()-1) && newr==pastr.get(pastr.size()-2) && newr==pastr.get(pastr.size()-3))
        good = false;
      else
        good = true;
      
  }
  while(!good);
  return newr;
}

/**void record() {
  if (record ==true){
  launch("goproon.sh");
  record = false;
  }
  
  else {
  }
}*/

void draw() {
  background(emptyColor);
  int m = minute();
  int s = second();
  
  /**if (m >= startT && m <= stopT) {
    record();
  }*/
  
  if (m >= startT && m <= stopT) {
    drawImage1(); //image is there the whole 5 minutes
    if ((m >= startT && m < stopT) && (s >= 30 && s < 49)) {
      print ("it is here");
      GPIO.digitalWrite(Light, true);
      GPIO.digitalWrite(Feeder, false);
    }
    if ((m >= startT && m < stopT) && (s > 50)) {
      print ("is it here?");
      GPIO.digitalWrite(Light, false);
      GPIO.digitalWrite(Feeder, true);
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