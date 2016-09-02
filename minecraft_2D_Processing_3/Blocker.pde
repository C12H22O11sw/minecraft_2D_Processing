class Blocker{
   
  float x;
  float y;
  float angle;
  float slope;
  float maxDistance = blockSize*5;
  float distance;
  void refresh(float px, float py){
    distance = sqrt(pow(x,2)+pow(y,2));
    angle = atan2(mouseX - x, mouseY -y);
    slope = mouseY-y/mouseX-x;
if(distance < maxDistance && false){
      x = mouseX/blockSize;
      y = mouseY/blockSize;
    }else{
      
      
      
      
      
      
      
      //      
      y = sqrt(pow(distance,2)*pow(slope,2)/2);
      
      
      
      
      
      
      
      y = cos(0)*maxDistance;
    }
    rect(x*blockSize,y*blockSize,20/blockSize,20/blockSize);
  }
}