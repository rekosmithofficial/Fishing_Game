class sailBoat
{
  int x;
  int y = 273;
  PImage aBoat;

  void update()
  {
    render();
  }

  sailBoat (int x)
  {
    this.x = x;
    aBoat = loadImage("boat.png");
  }

  void render()
  {
    image (aBoat, x, y, width/16, height/16);
  }
}
