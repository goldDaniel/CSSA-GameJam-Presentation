static PImage playerImage = null;

class Player extends Entity 
{   

  //takes 2 seconds to move the width of the screen
  float speed = width / 2;
  
  
  //can fire every 1/2 seconds
  float fireRate = 1.f/2.f;
  float fireTimer = 0;
  
  
  public Player()
  {
    //we only want to load the image once and re-use it if needed
    if(playerImage == null)
    {
       playerImage = loadImage("Assets/player.png");
    }

    entity_width = 64;
    entity_height = 64;
  
    x = width / 2;
    y = height - entity_height / 2;
    
    image = playerImage;
  }
  
  void update(float delta)
  {
    //MOVING//////////////////////
    if(input.isKeyDown('a'))
    {
      x -= speed * delta;      
    }
    if(input.isKeyDown('d'))
    {
      x += speed * delta;
    }
    
    if(x < entity_width / 2) x = entity_width / 2;
    if(x > width - entity_width / 2) x = width - entity_width / 2;
    
    
    //SHOOTING///////////////////
    fireTimer -= delta;
    if(fireTimer <= 0)
    {
      //create a bullet and reset the timer 
      if(input.isKeyDown(' '))
      {
        fireTimer = fireRate;
        
        game.addBullet(x, y);
      }
    } 
  }
}
