Puck puck;
Paddle left;
Paddle right;

int leftScore = 0;
int rightScore = 0;

float scoreSeperation = 100;

void setup()
{
  size(600, 400);
  puck = new Puck();
  
  left = new Paddle(true);
  right = new Paddle(false);
}

void draw()
{
  background(51);
  
  textSize(42);
  textFont(createFont("good_times_rg.ttf", 32));
  textAlign(RIGHT, TOP);
  text(leftScore, scoreSeperation, 10);
  textAlign(LEFT, TOP);
  text(rightScore, width - scoreSeperation, 10);
  
  puck.update();
  puck.hits(left);
  puck.hits(right);
  left.update();
  right.update();
  
  puck.show();
  left.show();
  right.show();
}

void keyPressed()
{
  if (key == 'a')
    left.move(-1);
  else if (key == 'z')
    left.move(1);
    
  if (key == 'k')
    right.move(-1);
  else if (key == 'm')
    right.move(1);
    
  if (key == 'r')
    puck.reset();
    
  if (key == 't')
  {
    puck.reset();
    leftScore = 0;
    rightScore = 0;
  }
}

void keyReleased()
{
  if (key == 'a' || key == 'z')
    left.move(0);
    
  if (key == 'k' || key == 'm')
    right.move(0);
}
