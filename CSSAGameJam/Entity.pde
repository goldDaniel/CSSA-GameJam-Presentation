abstract class Entity
{
  float x;
  float y;
  
  float entity_width;
  float entity_height;
  
  
  boolean isAlive = true;
  
  PImage image;
  
  public boolean isColliding(Entity other)
  {
      //we only want to check for collisions if both entities are alive
      if(isAlive && other.isAlive)
      {
        boolean collidingX = false;
        boolean collidingY = false;
        
        float minX = this.x - entity_width / 2;
        float maxX = this.x + entity_width / 2;
       
        float minY = this.y - entity_height / 2;
        float maxY = this.y + entity_height / 2;
        
        float otherMinX = other.x - entity_width / 2;
        float otherMaxX = other.x + entity_width / 2;
        
        float otherMinY = other.y - entity_height / 2;
        float otherMaxY = other.y + entity_height / 2;
        
        //check collisions along the X-axis
        if((minX > otherMinX && minX < otherMaxX) ||
           (maxX > otherMinX && maxX < otherMaxX))
        {
           collidingX = true; 
        }
        
        //check collisions along the Y-axis
        if((minY > otherMinY && minY < otherMaxY) ||
           (maxY > otherMinY && maxY < otherMaxY))
        {
           collidingY = true; 
        }
        
        //if we are colliding on both axes
        return collidingX && collidingY;
      }
      
      return false;
  }
  
  void draw()
  {
     if(!isAlive) return;
    
     pushMatrix();
     
     translate(x, y);
     image(image, -entity_width / 2, -entity_height / 2, entity_width, entity_height);
     
     popMatrix();
  }
}
