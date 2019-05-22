class Paddle
{
  float x;
  float y;
  float w;
  float h;
  
  float movementSpeed = 10;
  private float moveAmount = 0;
  
  boolean isLeft;
  
  Paddle(boolean _isLeft)
  {
    y = height / 2;
    w = 15;
    h = 100;
    
    if (_isLeft)
      x = w;
    else
      x = width - w;
      
    isLeft = _isLeft;
  }
  
  void update()
  {
    y += moveAmount;
    y = constrain(y, h / 2, height - h / 2);
  }
  
  void move(float amount)
  {
    moveAmount = amount * movementSpeed;
  }
  
  void show()
  {
     rectMode(CENTER);
     rect(x, y, w, h);
  }
}
