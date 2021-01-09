
Input input;
Game game;

float previousTimeMillis;

boolean mainMenu = true;

void setup()
{
 
  size(800, 600);
  
  input = new Input();
  game = new Game();
  
  previousTimeMillis = millis();
}

void draw()
{
  float currentTimeMillis = millis();
  float deltaTime = (currentTimeMillis - previousTimeMillis) / 1000.f;
  previousTimeMillis = currentTimeMillis;
  
  
  game.update(deltaTime);
  game.draw();
}
