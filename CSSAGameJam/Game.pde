class Game
{
  
  int score = 0;
  
  PImage background; 
  
  Player player;
  
  ArrayList<Bullet> bullets;
  
  //variables for enemies
  int startingEnemyCount;
  boolean moveEnemiesLeft = true;
  ArrayList<Enemy> enemies;
  float enemyMoveRate;
  float enemyMoveTimer;
  
  boolean isGameOver = false;
  String endText;
  
  Game()
  {
    player = new Player();
    
    bullets = new ArrayList<Bullet>();
    enemies = new ArrayList<Enemy>();
    
    background = loadImage("Assets/background.png");
    background.resize(width, height);
    
    resetGame();
  }
  
  void resetGame()
  {
    score = 0;
    isGameOver = false;
    bullets.clear();
    enemies.clear();
    player = new Player();
    //create enemies
    int numEnemiesX = 6;
    int numEnemiesY = 5;
    startingEnemyCount = numEnemiesX * numEnemiesY;
    
    float spacing = 64;
    
    float enemyGroupWidth = numEnemiesX * spacing;
    
    float startX = (width - enemyGroupWidth) / 2;
    float startY = spacing; 
    
    for(int x = 0; x < numEnemiesX; x++)
    {
      for(int y = 0; y < numEnemiesY; y++)
      {  
        Enemy enemy = new Enemy(startX + x * spacing, 
                                startY + y * spacing);
        
        enemies.add(enemy);
      }
    }
    
    enemyMoveRate = calculateEnemyMoveRate();
    enemyMoveTimer = 0;
    
    player.isAlive = true;
  }
  
  float calculateEnemyMoveRate()
  {
    float percentageAlive = ((float)enemies.size() / (float)startingEnemyCount); 
     
    return 0.1f + 1.4f * percentageAlive;
  }
  
  void update(float delta)
  {
    if(!isGameOver)
    {
      player.update(delta);  
      
      updateBullets(delta);
      updateEnemies(delta);  
    }
    else
    {
      if(input.isKeyDown(' '))
      {
        resetGame();
      }
    }
  }
  
  void updateBullets(float delta)
  {
   ArrayList<Bullet> deadBullets = new ArrayList<Bullet>();
    for(Bullet b : bullets)
    {
      b.update(delta); 
      if(!b.isAlive)
      {
         deadBullets.add(b); 
      }
    }
    bullets.removeAll(deadBullets); 
  }
  
  void loseGame()
  {
    isGameOver = true;
    endText = "You Lose!";
  }
  
  void winGame()
  {
    isGameOver = true;
    endText = "You Win!";
  }
  
  void updateEnemies(float delta)
  {
    enemyMoveRate = calculateEnemyMoveRate();
    moveEnemies(delta);
    checkEnemyCollisions();
  }
  
  void checkEnemyCollisions()
  {
    ArrayList<Enemy> deadEnemies = new ArrayList<Enemy>();
    for(Enemy e : enemies)
    {
      if(e.isColliding(player))
      {
        loseGame();
      }
      
      for(Bullet b : bullets)
      {
        if(e.isColliding(b))
        {
          b.isAlive = false;
          deadEnemies.add(e);
          
          score += 10;
        }
      }
    }
    enemies.removeAll(deadEnemies);
  }
  
  void moveEnemies(float delta)
  {
    enemyMoveTimer -= delta;
    if(enemyMoveTimer <= 0)
    {
      enemyMoveTimer = enemyMoveRate;
      
      boolean moveDown = false;
      for(Enemy e : enemies)
      {
        if(moveEnemiesLeft)
        {
          e.moveLeft();  
        }
        else
        {
          e.moveRight();  
        }
        
        if(e.touchingEdge())
        {
          moveDown = true;  
        }
      }
      
      if(moveDown)
      {
        moveEnemiesLeft = !moveEnemiesLeft;
        for(Enemy e : enemies)
        {
          e.moveDown();  
        }
      }
    }
  }
  
  void draw()
  {
    clear();
    image(background, 0, 0);
    
    if(isGameOver)
    {
      textAlign(CENTER, CENTER);
      textSize(64);
      text(endText, width/2, height/2);
      
      textSize(32);
      text("Final Score: " + score, width / 2, height / 2 + 64);
      
      text("Press Space to reset", width / 2, height / 2 + 128);
    }
    else
    {
      for(Bullet b : bullets)
      {
        b.draw(); 
      }
    
      for(Enemy e : enemies)
      {
        e.draw();  
      }
    
      player.draw();
      
      textSize(32);
      textAlign(LEFT,TOP);
      text("SCORE: " + score, 0, 0);
    }
  }
  
  void addBullet(float x, float y)
  {
    bullets.add(new Bullet(x, y));
  }
}
