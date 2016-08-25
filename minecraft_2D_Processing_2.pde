import java.util.Random;

int blockY = 200;
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

PImage skyBlock; 
PImage grassBlock; 
PImage dirtBlock; 
PImage stoneBlock; 
PImage coalOreBlock; 


PImage displayImage;



void setup(){
 size(1920,  1000);
 background(sky);
 frameRate(10);
 rand = new Random(randomSeed);
 skyBlock = loadImage("skyBlock.gif");
 grassBlock = loadImage("grassBlock.gif");
 dirtBlock = loadImage("dirtBlock.gif");
 stoneBlock = loadImage("stoneBlock.gif");
 coalOreBlock = loadImage("coalOreBlock.gif");


 displayImage = loadImage("defaltImage.gif");
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
      case 0:    displayImage = skyBlock;      break;
      case 1:    displayImage = stoneBlock;    break;
      case 2:    displayImage = dirtBlock;    break;
      case 3:    displayImage = grassBlock;     break;
      case 4:    fill(gold);     break;
      case 5:    fill(iron);     break;
      case 6:    fill(diamond);  break;
      case 7:    fill(coal);     break;
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
    rect(x - blockSize,drawY+panY,4,4);
    panX = -x;
  }  
  int X(){
    return x; 
  }
  int Y(){
    return y;  
  }
}

class World{
  
  Block[][] world = new Block[1000][1000];
  void generateTerain(){
    blockY = 40;
    float randomHolder;
    float thing = 0;
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
            
          else
            blockTrend = 0;
 
          thing += blockTrend; 
          blockY+=thing/30;
          for(int k = 0; k< blockY-1 && k < 500; k++){  
            blockType[i][k]   = 1;
            blockType[i][k+1] = 2;
            blockType[i][k+2] = 3;
          }
    }
  }
  void makeWorld(){
    blockY = 40;
    for(int i = 0; i<1000; i++){
      for(int j = 0; j< 1000; j++){
        world[i][j] = new Block(i,j,blockType[i][j]);
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
}
  