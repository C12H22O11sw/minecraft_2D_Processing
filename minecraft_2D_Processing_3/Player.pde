class Player{
  // varibles
  int x = blockSize*10;
  float y = 100;
  int currentLocomotion = 0;
  int velocity = 0;
   // other varibles 
  int walking = 0;
  int flying = 1;
  int swimming = 2;
  
  // constructors
  
  // void methods
  void moveX(int amount){
    x+= amount;
  }
 void moveY(float amount){
    y+= amount;
  }

  void fly(int h){
    y+=h;
    currentLocomotion = flying;
  }
  void land(){
    currentLocomotion = walking;
  }
  void fall(){
    if(currentLocomotion == walking){
        moveY(-1);
    }
  }
  void snapToGrid(){
    int closestBlock = (int)y;
    y = closestBlock;
  }
  void drawPlayer(){
    fill(0,0,0);
    //rect(x,(y-panY) - 2*blockSize,blockSize,2*blockSize);
    noStroke();
    rect((x-1)*blockSize+100 - panX, height-(y+panY-0.5)*blockSize, blockSize, blockSize*2);
    text(y +" "+ panY,1000,900);
  }  
   // varible methods
  int X(){
    return x; 
  }
  int Y(){
    return (int)y;  
  }
  boolean isFlying(){
    if(currentLocomotion == flying)
      return true;
    else return false;
  }
}