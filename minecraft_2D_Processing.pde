void setup(){
 size(1920,1000);
 background(0,119,200);
 frameRate(1);
}
int psudoRandom(int input, int maxRange){

  randomSeed(input);
  return (int)random(-(maxRange/2),maxRange/2);
}

void makeBlock(int x, int y,color BlockColor){
 fill(BlockColor);
 rect((x-1)*10,height-(y*10),10,10);
}
int blockY = 50;
int blockTrend = 0;
int blockRandom = (int)random(4);
boolean isWorldMade = false;
color stone = color(100,100,100);
color grass = color(50,150,50);
color dirt = color(150,100,50);
color gold = color(175,175,50);
color iron = color(150,125,125);
color diamond = color(150,230,250);
color coal = color(20,20,20);



class Block{
  int x;
  int y;
  int type = 2;
  Block(int x, int y, int type){
  this.x = x;
  this.y = y;
  this.type = type;
  }
  void makeBlock(){
    switch(type){
      case 1: fill(stone); break;
      case 2: fill(grass); break;
      case 3: fill(dirt); break;
      case 4: fill(gold); break;
      case 5: fill(iron); break;
      case 6: fill(diamond); break;
      case 7: fill(coal); break;
    }
     rect((x-1)*10,height-(y*10),10,10);
  }
}



class World{
  Block[][] world = new Block[1000][250];
  void makeWorld(){
    for(int i = 0; i<193; i++){
      for(int j = 0; j<blockY - 1; j++){
        if(j == blockY - 2){
           world[i][j] = new Block(i,j,2);
        }else if(j > blockY - 4){
          world[i][j] = new Block(i,j,3);
        }
        else{
          if(random(1000)<1){
            world[i][j] = new Block(i,j,4);
          }else if(random(100)<1){
            world[i][j] = new Block(i,j,5);
          }else if(random(2000)<1){
            world[i][j] = new Block(i,j,6);
          }else if(random(100)<1){
            world[i][j] = new Block(i,j,7);
          }
          else{
            world[i][j] = new Block(i,j,1);
          }
        }
        world[i][j].makeBlock();
      }
    blockY+=blockTrend;
    blockTrend += psudoRandom(i,4);//random(4)-21
    
  }
  
}
}
World world = new World();
int bla = 0;
void draw(){
  bla++;
  if(!isWorldMade){
     world.makeWorld();
    isWorldMade = true;
  }
  if(millis()%1000>2){
  fill(0,0,255);
    rect(0,0,200,200);
    fill(stone);
   text(psudoRandom(bla,4),100,100);
  }

   

   
}