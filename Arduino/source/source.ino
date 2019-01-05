float angle;
float distance;

void setup() 
{
  Serial.begin(57600);
  randomSeed(analogRead(0));
}

void loop()
{
  while(angle <= 360)
  {
    angle++; //Replace me!
    distance = random(80,100); //Replace me!

    format(angle,distance);
    delay(10);
  }

  angle = 0;
}
