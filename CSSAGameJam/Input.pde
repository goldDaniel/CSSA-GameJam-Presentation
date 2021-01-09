class Input
{
  private HashMap<Integer, Boolean> inputMap;

  public Input()
  {
    inputMap = new HashMap();  
  }
   
  //This is the method we will call when checking if we have pressed a key 
  public boolean isKeyDown(char pressed)
  {
      char pressedChar = Character.toLowerCase(pressed);
      if(inputMap.containsKey((int)pressedChar))
      {
          return inputMap.get((int)pressedChar);
      }
  
      return false;
  }
  
  public boolean isKeyDown(int pressed)
  {
    if(inputMap.containsKey(pressed))
    {
        return inputMap.get(pressed);
    }
    return false;
  }
  
  void keyPressed(int pressed)
  {
    inputMap.put(pressed, true);
  }
  
  void keyReleased(char released)
  {
    inputMap.put((int)released, false);
  }
}

void keyPressed()
{
      char pressed = Character.toLowerCase(key);
      input.keyPressed(pressed);
}

void keyReleased()
{
    char released = Character.toLowerCase(key);
    input.keyReleased(released);
}
