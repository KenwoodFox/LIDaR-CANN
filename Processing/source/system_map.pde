int lf = 47;    // Linefeed character in ASCII
String angle = null;
String distance = null;
Serial serialPort;  // The serial port

float distance_float; //The Float value of Distance
float angle_float; //The Float value of angle
float plotX; //The Plot value for X
float plotY; //The Plot value for Y
int zoom = 1; //The zoom factor

float distance_arb = 90; //Simulation distance
int angle_arb = 0; //Simulation angle

PFont f; //The font
int botY = 150; //Location of the bot in Y
int botX = 450; //Location of the bot in X
int botSize = 10; //Size of the bot
