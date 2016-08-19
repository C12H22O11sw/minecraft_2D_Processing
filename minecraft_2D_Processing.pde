void setup(){
 size(1920,1000); 
}

void makeBlock(int x, int y,color BlockColor){
 fill(BlockColor);
 rect((x-1)*10,height-(y*10),10,10);
}
int blockY = 50;
int blockTrend = 1;
int blockRandom = (int)random(4);
boolean isWorldMade = false;


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
    if(type == 1){
     fill(100,100,100);
    }else if(type == 2){
     fill(50,150,50);
    }else if(type == 3){
     fill(50,150,50);
    }else if(type == 4){
     fill(175,175,50);
    }else if(type == 5){
     fill(150,125,125);
    }else if(type == 6){
     fill(150,230,250);
    }else if(type == 7){
     fill(20,20,20);
    }
     rect((x-1)*10,height-(y*10),10,10);
  }
  }



class World{
  Block[][] world = new Block[1000][250];
  void makeWorld(){
    for(int i = 0; i<192; i++){
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
    blockTrend += random(4)-2;
    
  }
  
}
}
World world = new World();
void draw(){
  
  if(!isWorldMade){
     world.makeWorld();
    isWorldMade = true; 
   }
}
