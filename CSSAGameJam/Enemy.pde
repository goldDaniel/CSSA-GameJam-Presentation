static PImage enemyImage = null;

class Enemy extends Entity
{
  Enemy(float x, float y)
  {
    
    if(enemyImage == null)
    {
      enemyImage = loadImage("Assets/enemy.png");  
    }
    this.image = enemyImage;
    
    this.x = x;
    this.y = y;
    this.entity_width = 32;
    this.entity_height = 32;
  }
  
  void moveLeft()
  {
    x -= entity_width;
  }
  
  void moveRight()
  {
    x += entity_width;
  }
  
  void moveDown()
  {
    y += entity_height;  
  }
  
  boolean touchingEdge()
  {
    boolean leftEdge = false; 
    if(x - entity_width / 2 <= 0)
    {
      leftEdge = true;
    }
    
    boolean rightEdge = false; 
    if(x + entity_width / 2 >= width)
    {
      rightEdge = true;
    }
    
    
    return leftEdge || rightEdge;
  }
}
