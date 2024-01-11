import processing.sound.*;
PImage Main,Main2,Main3,Main4,Main5,Main6,Main7,Main8,Main9,Main10,MainMain;
PImage MainA,MainB,MainC,MainD,MainE,MainF,MainG,MainH,MainI,MainJ;
PImage start;
PFont killFont;

SoundFile BGM;
SoundFile Mainfight,Main2fight,Main3fight,Main4fight,Main5fight,Main6fight,Main7fight,Main8fight,Main9fight,Main10fight,shoot,Start;
int diffficulty = 60; //60frame or 30 frame or 10 frame

int state = 0;
int score = 0;
int kill = 0;
void setup(){
  size(1280,720);
  shoot = new SoundFile(this, "shoot2.mp3");
  Mainfight = new SoundFile(this, "MainFight.mp3");
  Main2fight = new SoundFile(this, "Main2Fight.mp3");
  Main3fight = new SoundFile(this, "Main3Fight.mp3");
  Main4fight = new SoundFile(this, "Main4Fight.mp3");
  Main5fight = new SoundFile(this, "Main5Fight.mp3");
  Main6fight = new SoundFile(this, "Main6Fight.mp3");
  Main7fight = new SoundFile(this, "Main7Fight.mp3");
  Main8fight = new SoundFile(this, "Main8Fight.mp3");
  Main9fight = new SoundFile(this, "Main9Fight.mp3");
  Main10fight = new SoundFile(this, "Main10Fight.mp3");
  Start = new SoundFile(this, "start.mp3");
  Main = loadImage("Main.png");
  Main2 = loadImage("Main2.png");
  Main3 = loadImage("Main3.png");
  Main4 = loadImage("Main4.png");
  Main5 = loadImage("Main5.png");
  Main6 = loadImage("Main6.png");
  Main7 = loadImage("Main7.png");
  Main8 = loadImage("Main8.png");
  Main9 = loadImage("Main9.png");
  Main10 = loadImage("Main10.png");
  MainA = loadImage("MainA.png");
  MainB = loadImage("MainB.png");
  MainC = loadImage("MainC.png");
  MainD = loadImage("MainD.png");
  MainE = loadImage("MainE.png");
  MainF = loadImage("MainF.png");
  MainG = loadImage("MainG.png");
  MainH = loadImage("MainH.png");
  MainI = loadImage("MainI.png");
  MainJ = loadImage("MainJ.png");
  start = loadImage("start.jpg");
  killFont = createFont("微軟正黑體 Bold",100);
  b = new ArrayList<Bullet>();
  e = new ArrayList<Enemy>();
  elite = new ArrayList<Elite>();
}
float px=500,py=300,pr = 15;
float a = 0;
ArrayList<Bullet>b;
ArrayList<Enemy>e;
ArrayList<Elite>elite;
class Enemy{
 float x,y,speed;
 int pattern,delete,hp=3,hp_max = 3;
 int second = 0;
 Enemy(float x,float y,float speed,int pattern){
   this.x=x;//敵人X
   this.y=y;//敵人Y
   this.speed=speed;//敵人速度
   this.pattern = pattern;
 }
 float r;
 void move(){
   second++;
   r = atan2(py-y,px-x);
   translate(x,y);
   //rotate(r);
   fill(255,0,0);
   strokeWeight(2);
   rect(-15,20,30,7);//血條
   fill(0,255,0);//健康的血
   rect(-15,20,30*(float(hp)/float(hp_max)),7);
   //rotate(-r);
   translate(-x,-y);
   if(second % 60 ==0){//敵人攻擊速度
     b.add(new Bullet(x,y,degrees(r),5,1));
   }
   x += cos(r)*speed;
   y += sin(r)*speed;
   fill(155,0,0);
   ellipse(x,y,30,30);
   if(hp < 1){
     delete = 1;
     kill += 1;//擊殺數+1
     score += 20;//打死加分
   }
 }
}
class Elite{
 float x,y,speed;
 int pattern,delete,hp=5,hp_max = 5;
 int second = 0;
 Elite(float x,float y,float speed,int pattern){
   this.x=x;//敵人X
   this.y=y;//敵人Y
   this.speed=speed;//敵人速度
   this.pattern = pattern;
 }
 float r;
 void move(){
   second++;
   r = atan2(py-y,px-x);
   translate(x,y);
   //rotate(r);
   fill(255,0,0);
   strokeWeight(2);
   rect(-15,20,30,7);//血條
   fill(0,255,0);//健康的血
   rect(-15,20,30*(float(hp)/float(hp_max)),7);
   //rotate(-r);
   translate(-x,-y);
   if(second % 45 ==0){//菁英攻擊速度
     b.add(new Bullet(x,y,degrees(r),5,1));
   }
   x += cos(r)*speed;
   y += sin(r)*speed;
   fill(255,127,39);
   ellipse(x,y,35,35);
   if(hp < 1){
     delete = 1;
     kill += 1;//擊殺數+1
     score += 50;//打死加分
   }
 }
}
class Bullet{//子彈
 float x,y,r,speed;//座標，角度，速度
 int pattern,delete;
 Bullet(float x,float y,float r,float speed,int pattern){
   this.x=x;//子彈X
   this.y=y;//子彈Y
   this.r=radians(r);//子彈角度
   this.speed=speed;//子彈速度
   this.pattern = pattern;
 }
 void move(){
   x += cos(r)*speed;
   y += sin(r)*speed;
   if(pattern != 0){
     fill(255,0,0);
     stroke(0);
     strokeWeight(2);
   }else{
     fill(255,255,0);
     stroke(0);
     strokeWeight(2);
   }
   ellipse(x,y,15,15);
   if(pattern != 0){
     if(dist(px,py,x,y)<7.5 + pr){
       hp -= 1;
       delete = 1;  
     }
   }else{
    for(int i=0;i<e.size();i++){
      if(dist(e.get(i).x,e.get(i).y,x,y)<7.5 +15){
        e.get(i).hp -=1;
        delete = 1;
      }
    }
    for(int i=0;i<elite.size();i++){
      if(dist(elite.get(i).x,elite.get(i).y,x,y)<7.5 +15){
        elite.get(i).hp -=1;
        delete = 1;
      }
    }
   }
 }
}
int hp = 100,hp_max = 100;
int second = 0;
void draw(){
  if(state==0){
    image(start,0,0,1280,720);
    fill(255,0,0);
    textSize(50);
    text("click to start",500,500);
  }
  else if(state==1){
    background(0);
    fill(0);
    rect(45,300,100,75);
    fill(#FF9900);
    textSize(50);
    text("easy",50,350);
    fill(0);
    rect(520,300,160,75);
    fill(#FF9900);
    textSize(50);
    text("normal",525,350);
    fill(0);
    rect(1125,300,100,75);
    fill(#FF9900);
    textSize(50);
    text("hard",1125,350);
  }
  else if(state==2){
    background(0);
    image(MainG,25,60,250,250);
    image(MainI,275,60,250,250);
    image(MainJ,525,60,250,250);
    image(MainF,775,60,250,250);
    image(MainH,1025,60,250,250);
    image(MainD,25,360,250,250);
    image(MainC,275,360,250,250);
    image(MainE,525,360,250,250);
    image(MainA,775,360,250,250);
    image(MainB,1025,360,250,250);
    textFont(killFont);
    text("請選擇角色",400,700);
  }
  else if(state==3){
    Start.stop();
    second++;
    background(155,255,120);
    if(right) px += 3;
    if(left) px -= 3;
    if(up) py -= 3;
    if(down) py += 3;
    if(px < pr) px = pr;//禁止從左邊出界
    if(px > width-pr) px = width-pr;//禁止從右邊出界
    if(py < pr) py = pr;//禁止從上面出界
    if(py > height-pr) py = height - pr;//禁止從下面出界
    a = atan2(mouseY -py, mouseX -px);
    translate(px,py);
    fill(255,0,0);
    strokeWeight(2);
    rect(-15,50,30,7);//血條
    fill(0,255,0);//健康的血
    if(hp>0) rect(-15,50,30*(float(hp)/float(hp_max)),7);
    rotate(a);
    stroke(0);
    strokeWeight(10);
    line(0,0,30,0);//砲管
    rotate(-a);
    translate(-px,-py);
    stroke(0);
    strokeWeight(3);
    fill(#39C5BB);
    image(MainMain,px,py,50,50);//玩家
    for(int i=0;i<b.size();i++){
      b.get(i).move();
      if(b.get(i).delete == 1){
        b.remove(i);
      }
    }
    if(second % diffficulty == 0){//敵人生成速度
      e.add(new Enemy(random(width),random(height),0.6,0));
    }
    if(second % 300 == 0){//敵人生成速度
      elite.add(new Elite(random(width),random(height),0.6,0));
    }
    for(int i=0;i<e.size();i++){
      e.get(i).move();
      if(e.get(i).delete == 1){
        e.remove(i);
      }
    }
    for(int i=0;i<elite.size();i++){
      elite.get(i).move();
      if(elite.get(i).delete == 1){
        elite.remove(i);
      }
    }
    if(hp<=0) state=4;
  }
  else if(state==4){
    background(0);
    BGM.stop();
    textSize(100);
    stroke(10);
    text("Score:"+score,700,360);
    textFont(killFont);
    text("遊戲結束",440,200);
    text("擊殺數:"+kill,125,360);
    fill(0);
    rect(420,500,450,200);
    fill(#FF9900);
    text("重新開始",440,650);
  }
}
boolean right,left,up,down;
void keyPressed(){
  if(keyCode == RIGHT) right = true;
  if(keyCode == LEFT) left = true;
  if(keyCode == UP) up = true;
  if(keyCode == DOWN) down = true;
}
void keyReleased(){
  if(keyCode == RIGHT) right = false;
  if(keyCode == LEFT) left = false;
  if(keyCode == UP) up = false;
  if(keyCode == DOWN) down = false;
}
boolean testInside(int x, int y, int w, int h){
  if( x<mouseX && mouseX<x+w && y<mouseY && mouseY<y+h) return true;
  else return false;
}
void mousePressed(){
  if(state==1){
    if(testInside(45,300,100,75)) { state=2; diffficulty=90; }
    if(testInside(520,300,160,75)) { state=2; diffficulty=60; }
    if(testInside(1125,300,100,75)) { state=2; diffficulty=30; }
  }
  if(state==2){
    if(testInside(50,360,200,200)) { state=3; MainMain = Main4; BGM=Main4fight; BGM.loop(); }//MainMain玩家選擇的角色
    if(testInside(300,360,200,200)) { state=3; MainMain = Main3; BGM=Main3fight; BGM.loop();}
    if(testInside(550,360,200,200))  { state=3; MainMain = Main5; BGM=Main5fight; BGM.loop(); }
    if(testInside(800,360,200,200))  { state=3; MainMain = Main; BGM=Mainfight;  BGM.loop();}
    if(testInside(1050,360,200,200))  { state=3; MainMain = Main2; BGM=Main2fight; BGM.loop(); }
    if(testInside(50,60,200,200))  { state=3; MainMain = Main7; BGM=Main7fight; BGM.loop(); }
    if(testInside(300,60,200,200))  { state=3; MainMain = Main9; BGM=Main9fight; BGM.loop(); }
    if(testInside(550,60,200,200))  { state=3; MainMain = Main10; BGM=Main10fight; BGM.loop(); }
    if(testInside(800,60,200,200))  { state=3; MainMain = Main6; BGM=Main6fight; BGM.loop(); }
    if(testInside(1050,60,200,200))  { state=3; MainMain = Main8; BGM=Main8fight; BGM.loop(); }
  }
  if(state==4){
    if(testInside(420,500,450,200)) {
      state=1; 
      hp=100;
      score = 0;
      kill = 0;
      for(int i=b.size()-1; i>=0; i--){
        b.remove(i);
      }
      for(int i=e.size()-1; i>=0; i--){
        e.remove(i);
      }
      for(int i=elite.size()-1; i>=0; i--){
        elite.remove(i);
      }
    }
  }
}
void mouseReleased(){
  if(state==0) {state=1; Start.loop();}
  if(state==3) Start.stop();
  if(state==3){
    b.add(new Bullet(px,py,degrees(a),5,0));
    shoot.play();
  }
}
