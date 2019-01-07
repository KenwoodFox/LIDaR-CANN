import processing.serial.*;

boolean simulate = false;

void setup() {
  size(800, 500);
  f = createFont("Arial", 16, true); // STEP 2 Create Font

  serial_setup(simulate);
}

void draw() {
  if (simulate != true)
  {
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
  } else
  {
    plotX = (distance_arb / zoom )* cos(radians(simulate()));
    plotY = (distance_arb / zoom )* sin(radians(simulate()));
  }
  background(255);
  textFont(f, 16);
  fill(0);

  if (angle != null || simulate == true) {
    text(distance_float, 10, 50);
    text(angle_float, 10, 100);
    text("If it fits it ships", 10, 150);
    if (simulate == true)
    {
      text("Simulation is ENABLED", 10, 200);
    } else
    {
      text("Simulation is DISABLED", 10, 200);
    }

    rect(botX - botSize / 2, botY - botSize / 2, botSize, botSize);
    line(botX + botSize / botSize, botY + botSize / botSize, plotX + botX, plotY + botY);
    ellipse(plotX + botX, plotY + botY, 3, 3);
  }
}
