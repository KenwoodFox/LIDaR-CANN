int simulate()
{
  if (angle_arb <=360)
  {
    angle_arb++;
  } 
  else
  {
    angle_arb = 0;
  }
  return angle_arb;
}
