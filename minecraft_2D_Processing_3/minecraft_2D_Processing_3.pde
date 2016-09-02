//imports
  import java.util.Random;
//varibles
  //ints
    int startBlockY = 100;
    int blockY = startBlockY;
    int randomSeed = 393344416;
    int blockRandom = (int)random(4);
    int blockSize = 8;
    int panX;
    int panY = 0;
    int seaLevel = 30;
  //floats/doubles
    float blockTrend;
  //chars
    char keyPRESSED = 's';
  //booleans
    boolean isWorldMade = false;
  //int arrays
    int[][] blockType = new int[1000][1000];
  //colors
    color   stone    =   color  ( 77,   77,   77);
    color   grass    =   color  (  0,  146,   69);
    color   dirt     =   color  ( 96,   56,   19);
    color   gold     =   color  (175,  175,   50);
    color   iron     =   color  (212,  187,  125);
    color   diamond  =   color  (  0,  255,  255);
    color   coal     =   color  ( 26,   26,   26);
    color   sky      =   color  (173,  255,  255);
  //images
    PImage skyBlock;         int skyID;
    PImage grassBlock;       int grassID;
    PImage dirtBlock;        int dirtID;
    PImage stoneBlock;       int stoneID;
    PImage coalOreBlock;     int coalOreID;
    PImage ironOreBlock;     int ironOreID;
    PImage goldOreBlock;     int goldOreID;
    PImage diamondOreBlock;  int diamondOreID;
    PImage emeraldOreBlock;  int emeraldOreID;
    PImage silverOreBlock;   int silverOreID; 
    PImage waterBlock;       int waterID;
    PImage lapisOreBlock;    int lapisOreID;
    PImage redstoneOreBlock; int redstoneOreID;
    PImage oakLogBlock;      int oakLogID;
    PImage gravleBlock;      int gravleID;
    PImage bedrockBlock;     int bedrockID;
    PImage snowyGrassBlock;  int snowyGrassID;
    PImage leafBlock;        int leafID;
    
    PImage displayImage;
  //minecraft objects
    World overworld = new World();
    Player player = new Player();
    Blocker blocker = new Blocker();

void setup(){
 size(1920,  1000);
 background(sky);
 frameRate(10);
 rand = new Random(randomSeed);
 skyBlock          =   loadImage("skyBlock.gif");          skyID = 0;
 grassBlock        =   loadImage("grassBlock.gif");        grassID = 1;
 dirtBlock         =   loadImage("dirtBlock.gif");         dirtID = 2;
 stoneBlock        =   loadImage("stoneBlock.gif");        stoneID = 3;
 coalOreBlock      =   loadImage("coalOreBlock.gif");      coalOreID = 4;
 ironOreBlock      =   loadImage("ironOreBlock.gif");      ironOreID = 5;
 goldOreBlock      =   loadImage("goldOreBlock.gif");      goldOreID = 6;
 diamondOreBlock   =   loadImage("diamondOreBlock.gif");   diamondOreID = 7;
 emeraldOreBlock   =   loadImage("emeraldOreBlock.gif");   emeraldOreID = 8;
 silverOreBlock    =   loadImage("silverOreBlock.gif");    silverOreID = 9;
 waterBlock        =   loadImage("waterBlock.gif");        waterID = 10;
 lapisOreBlock     =   loadImage("lapisOreBlock.gif");     lapisOreID = 11;
 redstoneOreBlock  =   loadImage("redstoneOreBlock.gif");  redstoneOreID = 12;
 oakLogBlock       =   loadImage("oakLogBlock.gif");       oakLogID = 13;
 gravleBlock       =   loadImage("gravleBlock.gif");       gravleID = 14;
 bedrockBlock      =   loadImage("bedrockBlock.gif");      bedrockID = 15;
 snowyGrassBlock   =   loadImage("snowyGrassBlock.gif");   snowyGrassID = 16;
 leafBlock         =   loadImage("leafBlock.gif");         leafID = 17;

 displayImage = loadImage("displayImage.gif");
}
Random rand;
int psudoRandom(int maxRange,int bias){
  return rand.nextInt(maxRange)-(maxRange/2)+bias;
}

void keyPressed(){
  keyPRESSED = key;
}  


void draw(){
  fill(255,0,0);
  if(keyPressed){
    fill(0,255,0);
  }
  rect(width-200,height-200,100,100);
  if(!isWorldMade){
    overworld.generateTerain();
    overworld.makeWorld();
    isWorldMade = true;
  }
  else{
    if(blockType[player.x][(int)player.y-2] == skyID){
      player.moveY(-0.5);
      rect(1450,450,200,200);
      fill(0,0,0);
      text(blocker.x +" " +blocker.y,1500,500);
    }else if(blockType[player.x][(int)player.y-2] == waterID){
      player.moveY(-0.5);
    }
    if(keyPRESSED == 'd' && keyPressed && (blockType[player.x+2][(int)player.y] == waterID || blockType[player.x+2][(int)player.y] == skyID)){
      player.moveX(1);
    }else if(keyPRESSED == 'a' && keyPressed && (blockType[player.x-2][(int)player.y] == waterID || blockType[player.x-2][(int)player.y] == skyID)){
      player.moveX(-1);
    }else if(keyPRESSED == ' ' && keyPressed && blockType[player.x][(int)player.y-2] != skyID){
      player.moveY(2);
    }
  }
  overworld.remakeWorld((int)player.x,(int)player.y,3);
  //player.snapToGrid();
  player.drawPlayer();
  blocker.refresh(player.x,player.y);


}