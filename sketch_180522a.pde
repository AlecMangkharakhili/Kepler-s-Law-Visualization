int count_b = 0; //<>//
int count_g = 0;
float earth_ang = 0;
float ven_ang = 0;
float earth_rad = 500;
float ven_rad = (.723 * earth_rad);

void setup() {
  fullScreen();
  background(255);
  frameRate(30);
}

void draw() {
  translate(width/2, height/2);
  float map_b = map(count_b, 0, 360, 0, 255);
  float map_g = map(count_g, 0, 360, 0, 255);
  float dist = dist(earth_rad*cos(radians(earth_ang)), earth_rad*sin(radians(earth_ang)), ven_rad*cos(radians(ven_ang)), ven_rad*sin(radians(ven_ang)));
  float distStroke = map(dist, 90, 605, 0, 255);
  stroke(0, 0, 255);
  ellipse(earth_rad*cos(radians(earth_ang)), earth_rad*sin(radians(earth_ang)), 3, 3);
  stroke(255, 0, 0);
  ellipse(ven_rad*cos(radians(ven_ang)), ven_rad*sin(radians(ven_ang)), 3, 3);

  //R based on distance between Earth and Venus
  //G based on location of Earth in orbit (degrees)
  //B based on number of times Earth completes a full orbit
  stroke(distStroke, map_b, map_g, 25);

  line(earth_rad*cos(radians(earth_ang)), earth_rad*sin(radians(earth_ang)), ven_rad*cos(radians(ven_ang)), ven_rad*sin(radians(ven_ang)));
  earth_ang -= .9856;
  ven_ang -= 1.602;
  count_b++;
  if (count_b > 360)
  {
    count_b = 0;
    count_g++;
  }
  if (count_g > 360)
  {
    count_b = 0;
    count_g = 0;
  }
}
