import java.util.Random;

int blockY = 500;
float blockTrend = 0;
int blockExponential = 0;
int randomSeed = 393344416;
int blockRandom = (int)random(4);
int blockSize = 16;
int playersX;
int playersY;
int panX;
int panY = 50;
float rockyness = 0.1;

int[][] blockType = new int[1000][1000];

char keyPRESSED = 's';

boolean isWorldMade = false;

color   stone    =   color  ( 77,   77,   77);
color   grass    =   color  (  0,  146,   69);
color   dirt     =   color  ( 96,   56,   19);
color   gold     =   color  (175,  175,   50);
color   iron     =   color  (212,  187,  125);
color   diamond  =   color  (  0,  255,  255);
color   coal     =   color  ( 26,   26,   26);
color   sky      =   color  (173,  255,  255);

PImage skyBlock;        int skyID;
PImage grassBlock;      int grassID; 
PImage dirtBlock;       int dirtID; 
PImage stoneBlock;      int stoneID;
PImage coalOreBlock;    int coalOreID;
PImage ironOreBlock;    int ironOreID;
PImage goldOreBlock;    int goldOreID;
PImage diamondOreBlock; int diamondOreID;
PImage emeraldOreBlock; int emeraldOreID;
PImage silverOreBlock;  int silverOreID;
PImage waterBlock;      int waterID;
PImage lapisOreBlock;   int lapisOreID;
PImage redstoneOreBlock;int redstoneOreID;
PImage oakLogBlock;     int oakLogID;
PImage gravleBlock;     int gravleID;

PImage displayImage;



void setup(){
 size(1920,  1000);
 background(sky);
 frameRate(10);
 rand = new Random(randomSeed);
 skyBlock        = loadImage("skyBlock.gif");        skyID = 0;         
 grassBlock      = loadImage("grassBlock.gif");      grassID = 1;
 dirtBlock       = loadImage("dirtBlock.gif");       dirtID = 2;
 stoneBlock      = loadImage("stoneBlock.gif");      stoneID = 3;
 coalOreBlock    = loadImage("coalOreBlock.gif");    coalOreID = 4;
 ironOreBlock    = loadImage("ironOreBlock.gif");    ironOreID = 5;
 goldOreBlock    = loadImage("goldOreBlock.gif");    goldOreID = 6;
 diamondOreBlock = loadImage("diamondOreBlock.gif"); diamondOreID = 7;
 emeraldOreBlock = loadImage("emeraldOreBlock.gif"); emeraldOreID = 8;
 silverOreBlock  = loadImage("silverOreBlock.gif");  silverOreID = 9;
 waterBlock      = loadImage("waterBlock.gif");      waterID = 10;
 lapisOreBlock   = loadImage("lapisOreBlock.gif");   lapisOreID = 11;
 redstoneOreBlock= loadImage("redstoneOreBlock.gif");redstoneOreID = 12;
 oakLogBlock     = loadImage("oakLogBlock.gif");     oakLogID = 13;
 gravleBlock     = loadImage("gravleBlock.gif");     gravleID = 14;

 displayImage = loadImage("displayImage.gif");
}
Random rand;
int psudoRandom(int maxRange,int bias){
  return rand.nextInt(maxRange)-(maxRange/2)+bias;
}

class Block{
  int x;
  int y;
  int type = 0;
  Block(int x, int y, int type){
    this.x = x;
    this.y = y;
    this.type = type;
  }
    Block(int x, int y){
    this.x = x;
    this.y = y;
  }
  void makeBlock(){
    switch(type){
      case 0:      displayImage = skyBlock;             break;
      case 1:      displayImage = grassBlock;           break;
      case 2:      displayImage = dirtBlock;            break;
      case 3:      displayImage = stoneBlock;           break;
      case 4:      displayImage = coalOreBlock;         break;
      case 5:      displayImage = ironOreBlock;         break;
      case 6:      displayImage = goldOreBlock;         break;
      case 7:      displayImage = diamondOreBlock;      break;
      case 8:      displayImage = emeraldOreBlock;      break;
      case 9:      displayImage = silverOreBlock;       break;
      case 10:     displayImage = waterBlock;           break;
      case 11:     displayImage = lapisOreBlock;        break;
      case 12:     displayImage = redstoneOreBlock;     break;
      case 13:     displayImage = oakLogBlock;          break;
      case 14:     displayImage = gravleBlock;          break;


  }
     //rect((x-1)*blockSize+100,height-(y*blockSize),blockSize,blockSize);
     image(displayImage, (x-1)*blockSize+100, height-(y*blockSize)+panY, blockSize, blockSize);
  }
  boolean isSolid(){
   if(type == 0) return false;
   else return true;
  }
}

class Player{
  int x = 10;
  int y = 40*blockSize;
  int drawY = height-y;

  int velocity = 0;
  void moveX(int amount){
    noStroke();
    fill(sky);
    drawY = height-y - blockSize;
    playersX = x;
    playersY = y;
    rect(x - blockSize+90,drawY+panY,blockSize,2*blockSize);
    x+= amount;
  }
  void jump(){
    velocity = -blockSize/2;
    playersX = x;
    playersY = y;
  }
  void fall(){
    noStroke();
    fill(sky); 
    drawY = height-y - blockSize;
    playersX = x;
    playersY = y;
    rect(x - blockSize+90,drawY+panY,blockSize,2*blockSize);
    y-= velocity;
    velocity += blockSize/8;
  }
  void snapToGridY(){
    if(y%blockSize > blockSize/4);
    y -= y%(-blockSize);
  }
  void drawPlayer(){
    fill(0,0,0);
    drawY = height-y - blockSize;
    playersX = x;
    playersY = y;
    rect(x - blockSize+90,drawY+panY-blockSize,blockSize,2*blockSize);
    fill(0,255,0);
    rect(x-(panX*blockSize),drawY+panY,4,4);
  }  
  int X(){
    return x; 
  }
  int Y(){
    return y;  
  }
}

class World{
  
  Block[][] world = new Block[10000][1000];
  void generateTerain(){
    blockY = 40;
    float randomHolder;
    float thing = 0;
    int blockTypeHolder = 0;
    for(int i = 0; i<500; i++){
          randomHolder = random(100);
          
          if(randomHolder > 98)
            blockTrend = 10;
          else if(randomHolder < 2)
            blockTrend = -10;
            
          else if(randomHolder > 94)
            blockTrend = 5;
          else if(randomHolder < 6)
            blockTrend = -5;
            
          else if(randomHolder > 92)
            blockTrend = 3;
          else if(randomHolder < 8)
            blockTrend = -3;
            
          else if(randomHolder > 86)
            blockTrend = 2;
          else if(randomHolder < 14)
            blockTrend = -2;
            
          else if(randomHolder > 78)
            blockTrend = 1;
          else if(randomHolder < 22)
            blockTrend = -1;
            
          else{}
            blockTrend = 0;
 
          thing += blockTrend; 
          blockY+=thing/30;
          for(int k = 0; k< blockY-1 && k < 500; k++){
            
            
            
          randomHolder = random(1000); 
          if(randomHolder > k*100 && randomHolder%100<2)
            blockTypeHolder = emeraldOreID;
            
          else if(randomHolder > k*100 && randomHolder%50<2)
            blockTypeHolder = diamondOreID;
            
          else if(randomHolder > k*10 && randomHolder%130<2)
            blockTypeHolder = ironOreID;
            
          else if(randomHolder > k*100 && randomHolder%30<2)
            blockTypeHolder = goldOreID;
            
          else if(randomHolder%50<2)
            blockTypeHolder = coalOreID;
            
          else if(randomHolder%1000<2)
            blockTypeHolder = oakLogID;
            
          else if(randomHolder > k*100 && randomHolder%53<2)
            blockTypeHolder = waterID;
          else
            blockTypeHolder = stoneID;

            blockType[i][k] = blockTypeHolder;
            blockType[i][k+1] = 2;
            blockType[i][k+2] = 1;
          }
    }
  }
  void makeWorld(){
    blockY = 40;
    for(int i = 0; i<1000; i++){
      for(int j = 0; j< 1000; j++){
        if(i-panX>0){
          world[i-panX][j] = new Block(i,j,blockType[i][j]);
          world[i-panX][j].makeBlock(); 
        }        
      }
    }
  }
  void remakeWorld(int x, int y, int range){
    blockY = 40;
    int iLoopStart = x-range;
    int jLoopStart = y-range;
    if(x>=range)
      iLoopStart = 0;
    if(y>=range)
      jLoopStart = 0;
    for(int i = iLoopStart; i<x+range; i++){
      for(int j = jLoopStart; j< y+range; j++){
        if(i > panX && i < 10000 && j > panY && j < 1000){
          world[i][j] = new Block(i,j,blockType[i-panX][j]);
          world[i][j].makeBlock();
        }
      }
    }
  }
}
void keyPressed(){
  keyPRESSED = key;
}  
World overWorld = new World();
Player player = new Player();
void draw(){
  fill(255,0,0);
  if(keyPressed){
    fill(0,255,0);
  }
  rect(width-200,height-200,100,100);
  if(!isWorldMade){
    overWorld.generateTerain();
    overWorld.makeWorld();
    isWorldMade = true;
  }
  else{
    fill(stone);
    if(player.Y()/blockSize>0)
    if(blockType[player.X()/blockSize][player.Y()/blockSize] <1){
      player.fall();
    }
    else if(keyPRESSED == ' ' && keyPressed){
      player.jump();
      player.fall(); 
    }
    else{
      player.snapToGridY();
    }
    if(keyPRESSED == 'd' && keyPressed){
      if(blockType[player.X()/blockSize+1][player.Y()/blockSize+1] <1){
        player.moveX(blockSize);
      }
    }
    else if(keyPRESSED == 'a' && keyPressed){
      if(blockType[player.X()/blockSize-1][player.Y()/blockSize+1] <1){
        player.moveX(-blockSize);
      }
    }
      overWorld.remakeWorld(player.X()/blockSize+1,player.Y()/blockSize,5);
      player.drawPlayer();
  } 
  if(player.X()>width+panX){
    panX+=width/blockSize;
    overWorld.makeWorld();
  }
  fill(0,0,0);
  rect(850,50,100,100);
  fill(255,255,255);
  text(player.X(),900,70);
  fill(255,255,0);
  text(panX,900,100);
    fill(255,0,0);
  text(panX,900,130);
}
  
