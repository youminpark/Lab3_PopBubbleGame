class Bubble
{
  float circleX, circleY, speed;
  int diameter, colorR, colorB;
  
Bubble()
  {
  diameter = int(random(20, 50));
  circleX = random(20, width - 20);
  circleY = height;
  colorR = int(random(100, 255));
  colorB = int(random(50, 200));
  speed = random(2, 6);
  }

  void drawCircle()
  {
  fill(colorR, 0, colorB, 75);
  circle(circleX, circleY, diameter);
  }

  void move()
  {
  circleY = circleY - speed*speedMult;
  }

  void checkForClick()
  {
  if (mousePressed && dist(mouseX, mouseY, circleX, circleY) <= (diameter / 2))
  {
    score++;
    speedMult+= .2;
    circleY = height;
    circleX = random(20, width - 20);
    diameter = int(random(20, 50));
    colorR = int(random(100, 255));
    colorB = int(random(50, 200));
  }
  }

  void jiggle()
  {
  circleX = circleX + random(-2, 2);
  }

  void boundaryCheck()
  {
  if (circleY <= 0)
  {
    score--;
    speedMult -= .2;
    circleY = height;
    circleX = random(20, width - 20);
    diameter = int(random(20, 50));
    colorR = int(random(100, 255));
    colorB = int(random(50, 200));
  }
  }

  void runAll()
  {
  drawCircle();
  move();
  checkForClick();
  jiggle();
  boundaryCheck();
  }
}
