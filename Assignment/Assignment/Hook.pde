class Hook
{
  int x;
  int y = 273;
  int speedY;
  PImage aHook;

  Hook (int x)
  {
    this.x = x;
    aHook = loadImage("Hook.png");
  }

  void update()
  {
    move();
    render();
  }


  void render()
  {
    image (aHook, x, y, width/16, height/16);
    line(x + 30, y, x + 30, 273); //draws the line for the hook.
  }

  void checkCollisions()
  {
    if (y <= 273)
      y = 273;

    if (y >= 680)
      y = 680;
  }

  void move()
  {
    checkCollisions();
  }
}
