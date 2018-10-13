class codFish
{
  int x;
  int y = 450;
  int speedX;
  PImage aFish;
  boolean fishRendered = true; //used to make fish disappear when they are caught.

  void update()
  {
    move();
    render();
  }

  codFish(int x, int y, int dx)
  {
    this.x = x;
    this.y = y;
    this.speedX = dx;
    aFish = loadImage("fish.png");
  }

  void render()
  {
    if (fishRendered)
    {
      image (aFish, x, y, width/24, height/24);
    }
  }

  void checkCollisions()
  {
    int edge = 5;

    if (x<=(edge-edge)) 
    {
      speedX=2;
      y -=50;
    }
    if (x>=780-(edge*2)) 
    {
      speedX=-2;
      y -=50;
    }
  }






  void move()
  {
    checkCollisions();
    x = x+speedX;
  }
}
