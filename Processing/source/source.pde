import processing.serial.*;

int lf = 47;    // Linefeed character in ASCII
String angle = null;
String distance = null;
Serial serialPort;  // The serial port

float distance_float;
float angle_float;
float plotX;
float plotY;
int zoom = 1;

PFont f;
int botY = 150;
int botX = 450;
int botSize = 10;

void setup() {
  size(800, 500);
  f = createFont("Arial", 16, true); // STEP 2 Create Font

  printArray(Serial.list()); //List serial ports
  serialPort = new Serial(this, Serial.list()[1], 57600); //set the port and rate

  serialPort.clear(); //Throw away the first reading in case we caught it in the middle of a transmission

  angle = serialPort.readStringUntil(lf); //Populate the string angle with data untill the linefeed
  angle = null;
}

void draw() {
  if (serialPort.available() > 0) {
    angle = serialPort.readStringUntil(lf); //Take the angle
    distance = serialPort.readStringUntil(lf); //Take the distance

    angle = angle.replace("/", ""); //Clean up the numbers by taking out the lf
    distance = distance.replace("/", "");

    angle_float = Integer.parseInt(angle);
    distance_float = Integer.parseInt(distance);

    plotX = (distance_float / zoom )* cos(radians(angle_float));
    plotY = (distance_float / zoom )* sin(radians(angle_float));
  }
  background(255);
  textFont(f, 16);
  fill(0);

  if (angle != null) {
    text(distance_float, 10, 50);
    text(angle_float, 10, 100);
    text("If it fits it ships", 10, 150);

    //while (angle_float <= 360)
    //{
      rect(botX - botSize / 2, botY - botSize / 2, botSize, botSize);
      line(botX + botSize / botSize, botY + botSize / botSize, plotX + botX, plotY + botY);
      ellipse(plotX + botX, plotY + botY, 3,3);
    //}
  }
}
