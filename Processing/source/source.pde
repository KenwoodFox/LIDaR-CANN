import processing.serial.*;

int lf = 47;    // Linefeed character in ASCII
String angle = null;
Serial serialPort;  // The serial port
PFont f;                           // STEP 1 Declare PFont variable

void setup() {
  size(200, 200);
  f = createFont("Arial", 16, true); // STEP 2 Create Font

  printArray(Serial.list()); //List serial ports
  serialPort = new Serial(this, Serial.list()[1], 57600); //set the port and rate

  serialPort.clear(); //Throw away the first reading in case we caught it in the middle of a transmission

  angle = serialPort.readStringUntil(lf); //Populate the string angle with data untill the linefeed
  angle = null;
}

void draw() {
  if (serialPort.available() > 0) {
    angle = serialPort.readStringUntil(lf);
  }
  background(255);
  textFont(f, 16);                  // STEP 3 Specify font to be used
  fill(0);                         // STEP 4 Specify font color
  if (angle != null) {
    text(angle, 10, 100);
    text("Hello Strings!", 10, 150);   // STEP 5 Display Text
  }
}
