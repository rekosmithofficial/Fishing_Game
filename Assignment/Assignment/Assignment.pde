PImage aBackground; //loads the background image //<>//
int x;
int y;
int columns = 4;
int rows = 4;
int counter = 0;
boolean IfKeyReleased;
codFish[][] fish;
sailBoat player1; 
enemyShark enemy1, enemy2, enemy3, enemy4, enemy5;
Hook hook;

void setup()
{
  javax.swing.JOptionPane.showMessageDialog(null, "Welcome to RekoCorp's Fishing Game!");
  javax.swing.JOptionPane.showMessageDialog(null, "You need to collect all the fish but be careful of the sharks.");
  javax.swing.JOptionPane.showMessageDialog(null, "If a shark hits the boat, or the fish reach the boat, it's game over. There's 16 to catch. Good luck!");
  size(800, 800); //size of the game
  aBackground = loadImage("background.png");
  aBackground.resize(width, height);
  player1 = new sailBoat(350); //creating a new player
  enemy1 = new enemyShark(700); //creating a new shark
  enemy2 = new enemyShark(200);
  enemy3 = new enemyShark(400);
  enemy4 = new enemyShark(500);
  enemy5 = new enemyShark(300);
  hook = new Hook(350); //creating a new hook
  fish = new codFish[columns][rows];
  x = 350;
  y = 450;

  for (int i = 0; i < columns; i++)
  {
    for (int j = 0; j < rows; j++)
    {
      fish[i][j] = new codFish(x, y, 2);
      x = x + 50;
    }
    x = 350;
    y = y + 50;
  }
}



void GameMode() //this is where collisions occur between the player and the shark
{
  if (player1.y >= enemy1.y - 40 && player1.y <= enemy1.y + 40 && player1.x >= enemy1.x - 20 && player1.x <= enemy1.x + 20) //this function method creates a box around the boat
  {
    javax.swing.JOptionPane.showMessageDialog(null, "Game over. Please try again.");
    setup(); //game resets
  }

  if (player1.y >= enemy2.y - 40 && player1.y <= enemy2.y + 40 && player1.x >= enemy2.x - 20 && player1.x <= enemy2.x + 20) //this function method creates a box around the boat
  {
    javax.swing.JOptionPane.showMessageDialog(null, "Game over. Please try again.");
    setup(); //game resets
  }

  if (player1.y >= enemy3.y - 40 && player1.y <= enemy3.y + 40 && player1.x >= enemy3.x - 20 && player1.x <= enemy3.x + 20) //this function method creates a box around the boat
  {
    javax.swing.JOptionPane.showMessageDialog(null, "Game over. Please try again.");
    setup(); //game resets
  }

  if (player1.y >= enemy4.y - 40 && player1.y <= enemy4.y + 40 && player1.x >= enemy4.x - 20 && player1.x <= enemy4.x + 20) //this function method creates a box around the boat
  {
    javax.swing.JOptionPane.showMessageDialog(null, "Game over. Please try again.");
    setup(); //game resets
  }

  if (player1.y >= enemy5.y - 40 && player1.y <= enemy5.y + 40 && player1.x >= enemy5.x - 20 && player1.x <= enemy5.x + 20) //this function method creates a box around the boat
  {
    javax.swing.JOptionPane.showMessageDialog(null, "Game over. Please try again.");
    setup(); //game resets
  }
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


  for (int i = 0; i < columns; i++)
  {
    for (int j = 0; j < rows; j++)
    {
      if (hook.y >= fish[i][j].y - 40 && hook.y <= fish[i][j].y + 40 && hook.x >= fish[i][j].x - 40 && hook.x <= fish[i][j].x + 40) //this function method creates a box around the fish
      {
        fish[i][j].x = hook.x;
        fish[i][j].y = hook.y;
      }
    }
  }
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void keyPressed()
{
  if (key == CODED)
  {
    if (keyCode == LEFT && player1.x >= 10) //if the player presses left, both the boat and hook go left.
    {
      player1.x -= 10;
      hook.x -= 10;
    } else if (keyCode == RIGHT && player1.x <= width-60) //if the player presses right, both the boat and hook go right.
    {
      player1.x += 10;
      hook.x +=10;
    } else if (keyCode == DOWN) //if the player presses down, the hook will drop.
    {
      hook.y += 10;
    }
  }
}

void keyReleased()
{
  if (keyCode == DOWN) //if the player presses up, the hook will be pulled up.
  {
    IfKeyReleased = true;
  }
}



void draw()
{
  image(aBackground, 0, 0); 
  player1.update(); //calls the update function in the boat class.
  //enemy1.update(); //calls the update function in the shark class.
  switch (counter) //switch/case statement for increasing levels. When you increase a level, more sharks appear.
  {
  case 0:
    enemy1.update();
    text("LEVEL 1", 100, 120);
    break;

  case 1: 
    enemy1.update();
    text("LEVEL 1", 100, 120);
    break;

  case 2:
    enemy1.update();
    enemy2.update();
    text("YOU'VE REACHED LEVEL 2!", 100, 120);
    break;

  case 3:
    enemy1.update();
    enemy2.update();
    text("LEVEL 2", 100, 120);
    break;

  case 4: 
    enemy1.update();
    enemy2.update();
    enemy3.update();
    text("YOU'VE REACHED LEVEL 3!", 100, 120);
    break;

  case 5:
    enemy1.update();
    enemy2.update();
    enemy3.update();
    text("LEVEL 3", 100, 120);
    break;

  case 6:
    enemy1.update();
    enemy2.update();
    enemy3.update();
    enemy4.update();
    text("YOU'VE REACHED LEVEL 4!", 100, 120);
    break;

  case 7:
    enemy1.update();
    enemy2.update();
    enemy3.update();
    enemy4.update();
    text("LEVEL 4", 100, 120);
    break;

  case 8:
    enemy1.update();
    enemy2.update();
    enemy3.update();
    enemy4.update();
    enemy5.update();
    text("YOU'VE REACHED THE FINAL LEVEL!", 100, 120);
    break;

  case 16:
    enemy1.update();
    enemy2.update();
    enemy3.update();
    enemy4.update();
    enemy5.update();
    javax.swing.JOptionPane.showMessageDialog(null, "Congratulations, you've won!"); //when you collect all the fish, you win.
    setup();
    break;

  default: 
    enemy1.update();
    enemy2.update();
    enemy3.update();
    enemy4.update();
    enemy5.update();
    text("FINAL LEVEL", 100, 120);
  }
  hook.update(); //calls the update function in the hook class.
  for (int i = 0; i < columns; i++)
  {
    for (int j = 0; j < rows; j++)
    {

      fish[i][j].update();
    }
  }

  if (IfKeyReleased)
  {
    hook.y -= 5;
    if (hook.y <= 273)
    {
      IfKeyReleased = false;
    }
  }

  GameMode(); //calls the GameMode function in this class.
  //text("Score:" + counter, 20, 30);
  textSize(20);
  fill(0, 0, 0);
  // counter = 0;
  updateScore();
  for (int i = 0; i < columns; i++)
  {
    for (int j = 0; j < rows; j++)
    {
      if (fish[i][j].y <= 293) //this function method creates a box around the fish
      {
        fish[i][j].fishRendered = false;
      }
    }
  }
  
  
}

void updateScore()
{
  counter = 0;
  for (int i = 0; i < columns; i++)
  {
    for (int j = 0; j < rows; j++)
    {
      if (!fish[i][j].fishRendered)
      {
        counter = counter + 1;
                                 //if a fish is caught, increase the amount of fish caught by 1.
      }
    }
  }
  text("Score: " + counter, 100, 100);
}
