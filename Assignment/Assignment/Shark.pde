class enemyShark
{
  int x;
  int y;
  int speed = 3;
  PImage aShark;

  void update()
  {
    move();
    render();
  }

  enemyShark(int dy)
  {
    this.y = dy;
    aShark = loadImage("shark.png");
  }

  void render()
  {
    image(aShark, x, y, 50, 50);
  }

  void move()
  {
    y = y-speed;
    if (y <=300)
    {
      y = 700;
      x = (int)(random(20, 690)); //spawns shark in random places
    }
  }
}
