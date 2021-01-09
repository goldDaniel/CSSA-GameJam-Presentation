static PImage bulletImage = null;

class Bullet extends Entity
{
  //bullet will hit the top of the screen after 1/2 seconds
  float speed = height * 2; 
  
  Bullet(float x, float y)
  {
    if(bulletImage == null)
    {
      bulletImage = loadImage("Assets/laser.png");
    }
    
    this.x = x;
    this.y = y;
    this.entity_width = 8;
    this.entity_height = 64;
    
    this.image = bulletImage;
  }
  
  void update(float delta)
  {
    y -= speed * delta;
    
    if(y< -entity_height)
    {
     isAlive = false; 
    }
  }
}
