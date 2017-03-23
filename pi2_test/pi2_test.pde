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
          drawImage2();
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

void drawImage2() {
  rect(0, height*0, width, height*0.07);
  rect(0, height*0.15, width, height*0.07);
  rect(0, height*0.3, width, height*0.07);
  rect(0, height*0.45, width, height*0.07);
  rect(0, height*0.6, width, height*0.07);
  rect(0, height*0.75, width, height*0.07);
  rect(0, height*0.9, width, height*0.07);
}