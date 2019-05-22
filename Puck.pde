class Puck
{
  float x = width / 2;
  float y = height / 2;
  
  float size = 20;
  
  float angle;
  float speed = 0;
  float maxSpeed = 5;
  float acceleration = 0.2;
  
  boolean lastHit;
  
  Puck()
  {
    reset();
  }
  
  void reset()
  {
    angle = random(TWO_PI);
    x = width / 2;
    y = height / 2;
    speed = 0;
  }
  
  void update()
  {
    speed += acceleration;
    speed = constrain(speed, 0, maxSpeed);
    x += speed * cos(angle);
    y += speed * sin(angle);
    
    if (y < size / 2 || y > height - size / 2)
      angle *= -1;
      
    if (x < 0)
    {
      rightScore++;
      reset();
    }
      
    if (x > width)
    {
      leftScore++;
      reset();
    }
  }
  
  void hits(Paddle p)
  {
    if (lastHit == p.isLeft)
    {
      lastHit = !lastHit;
      
      if (x - size / 2 < p.x + p.w / 2 && x + size / 2 > p.x - p.w / 2 && y - size / 2 < p.y + p.h / 2 && y - size / 2 > p.y - p.h / 2)
      {
        angle += PI;
        angle *= -1;
      }
    }
  }
  
  void show()
  {
    fill(255);
    ellipse(x, y, size, size);
  }
}
