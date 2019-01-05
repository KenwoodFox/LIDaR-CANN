void serial_setup(boolean simulate)
{
  if(simulate != true){
  printArray(Serial.list()); //List serial ports
  serialPort = new Serial(this, Serial.list()[1], 57600); //set the port and rate

  serialPort.clear(); //Throw away the first reading in case we caught it in the middle of a transmission

  angle = serialPort.readStringUntil(lf); //Populate the string angle with data untill the linefeed
  angle = null;
  }
}
