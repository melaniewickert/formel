import processing.io.*;
int emptyColor = 255;
//int Feeder = 26;
boolean good = true;
boolean record = true;
int startT = 42;
int stopT = startT + 1;


void setup() {
  fullScreen();
  noCursor();
  background(emptyColor);
  noStroke();
  fill(0);
  GPIO.pinMode(Feeder, GPIO.OUTPUT);
  GPIO.digitalWrite(Feeder, true);
}


void draw() {
  background(emptyColor);
  int d = day();
  int h = hour();
  int m = minute();
  int s = second();
  
  if (h == 14 || h == 15) {
   if ((m >= startT && m < stopT)){
     if (s >= 0 && s <= 5) {
          drawImage1();
        }
        /**if (s >= 9 && s < 15) {
          //print ("it is here");
          GPIO.digitalWrite(Feeder, false);
        }
        if (s > 30) {
          //print ("is it here?");
          GPIO.digitalWrite(Feeder, true);
        }
      }*/
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