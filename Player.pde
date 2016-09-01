class Player{
  // varibles
  int x = blockSize*10;
  int y = (-1000*blockSize);
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
  void setY(int y){
    this.y = y;
  }
  void jump(){
    velocity = -blockSize/2;
  }
  void fly(int h){
    y+=h;
    currentLocomotion = flying;
  }
  void land(){
    currentLocomotion = walking;
  }
  void fall(){
    if(currentLocomotion != flying){
        y+= blockSize;
        velocity += blockSize/8; 
    }
  }
  void snapToGridY(){
    int closestBlock = y/blockSize;
    y = closestBlock*blockSize;
  }
  void drawPlayer(){
    fill(0,0,0);
    //rect(x,(y-panY) - 2*blockSize,blockSize,2*blockSize);
    rect(x,170,blockSize,2*blockSize);
    text(y +" "+ panY,1000,900);
  }  
   // varible methods
  int X(){
    return x; 
  }
  int Y(){
    return y;  
  }
  boolean isFlying(){
    if(currentLocomotion == flying)
      return true;
    else return false;
  }
}