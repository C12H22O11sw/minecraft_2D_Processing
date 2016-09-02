class World{
  
  Block[][] world = new Block[10000][1000];
  public int[] elevation = new int[10000];
  
  
  void makeTree(int x, int y){
      blockType[3+x][0+y] = oakLogID;
      blockType[3+x][1+y] = oakLogID;
      blockType[1+x][2+y] = leafID;
      blockType[2+x][2+y] = leafID;
      blockType[3+x][2+y] = leafID;
      blockType[4+x][2+y] = leafID;
      blockType[5+x][2+y] = leafID;
      blockType[1+x][3+y] = leafID;
      blockType[2+x][3+y] = leafID;
      blockType[3+x][3+y] = leafID;
      blockType[4+x][3+y] = leafID;
      blockType[5+x][3+y] = leafID;
      blockType[2+x][4+y] = leafID;
      blockType[3+x][4+y] = leafID;
      blockType[4+x][4+y] = leafID;

  }
  
  
  
  void generateTerain(){
    blockY = startBlockY;
    float randomHolder;
    float thing = 0;
    for(int i = 0; i<1000; i++){
          randomHolder = random(100);
          int blockHolder = 0;
          if(randomHolder > 98  && random(blockY) < 10)
            blockTrend = 10;
          else if(randomHolder < 2  && random(startBlockY-blockY) < 10)
            blockTrend = -10;
            
          else if(randomHolder > 94  && random(blockY) < 10)
            blockTrend = 5;
          else if(randomHolder < 6  && random(startBlockY-blockY) < 10)
            blockTrend = -5;
            
          else if(randomHolder > 92  && random(blockY) < 10)
            blockTrend = 3;
          else if(randomHolder < 8  && random(startBlockY-blockY) < 10)
            blockTrend = -3;
            
          else if(randomHolder > 86  && random(blockY) < 10)
            blockTrend = 2;
          else if(randomHolder < 14  && random(startBlockY-blockY) < 10)
            blockTrend = -2;
            
          else if(randomHolder > 78  && random(blockY) < 10)
            blockTrend = 1;
          else if(randomHolder < 22  && random(startBlockY-blockY) < 10)
            blockTrend = -1;
            
          else
            blockTrend = 0;
   
          thing += blockTrend*2; 
          if(randomHolder > 70 && i%50 < 1 && thing >=0)
            blockY+=5;
          if(randomHolder <30 && i%50 < 1&& thing <0)
            blockY-=5;
          if(blockY<10){
            thing = 10;
          }else if(blockY<3){
            blockY = 7;
          }
          if(blockY>490){
            thing = -10;
          }else if(blockY>497){
            blockY = 493;
          }
          blockY+=(thing/40);
          
          
          for(int k = 0; k< blockY-1 && k < 500; k++){  
            randomHolder = random(1000);
            if(k <random(2)+1)
              blockHolder = bedrockID;
            else if(randomHolder > 999 && random(blockY) < 10)
              blockHolder = emeraldOreID;
            else if(randomHolder > 998 && random(blockY) < 10)
              blockHolder = diamondOreID;
            else if(randomHolder > 996 && random(blockY) < 10)
              blockHolder = goldOreID;
            else if(randomHolder > 993 && random(blockY) < 10)
              blockHolder = lapisOreID;        
            else if(randomHolder > 990 && random(blockY) < 10)
              blockHolder = redstoneOreID;
            else if(randomHolder > 978 && random(blockY) < 10)          
              blockHolder = coalOreID;
            else if(randomHolder > 976 && random(blockY) < 10)
              blockHolder = silverOreID;
            else
              blockHolder = stoneID;
            
            blockType[i][k]   = blockHolder;
            blockType[i][k+1] = dirtID;
            if(k<100)
              blockType[i][k+2] = grassID;
            else
              blockType[i][k+2] = snowyGrassID;
              
            elevation[i] = k+2;
          }
          for(int k = blockY; k< seaLevel && k > 0; k++){
            blockType[i][k] = waterID;
            elevation[i] = k;
          }
          
 
    }
  }
  void makeWorld(){
    blockY = 40;
    for(int i = 0; i<1000; i++){
      for(int j = 0; j< 500; j++){
        world[i][j] = new Block(i,j,blockType[i][j]);//
        world[i][j].makeBlock();         
      }
    }
  }
  void remakeWorld(int x, int y, int range){
    blockY = 40;
    for(int i = x-range; i<x+range; i++){
      for(int j = y-range; j< y+range; j++){
        if(i > 0 && i < 1000 && j > 0 && j < 1000){
          world[i][j] = new Block(i,j,blockType[i][j]);
          world[i][j].makeBlock();
        }
      }
    }
  }
}