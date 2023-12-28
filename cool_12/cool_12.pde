import processing.sound.*;
PImage Main,Main2,Main3,Main4,Main5,MainMain;
PImage MainA,MainB,MainC,MainD,MainE;
PImage start;
PFont killFont;

SoundFile fight,shoot;
int diffficulty = 60; //60frame or 30 frame or 10 frame

int state = 0;
int score = 0;
int kill = 0;
void setup(){
  size(1280,720);
  fight = new SoundFile(this, "fight.mp3");
  shoot = new SoundFile(this, "shoot2.mp3");
  Main = loadImage("Main.png");
  Main2 = loadImage("Main2.png");
  Main3 = loadImage("Main3.png");
  Main4 = loadImage("Main4.png");
  Main5 = loadImage("Main5.png");
  MainA = loadImage("MainA.png");
  MainB = loadImage("MainB.png");
  MainC = loadImage("MainC.png");
  MainD = loadImage("MainD.png");
  MainE = loadImage("MainE.png");
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
    image(MainD,25,360,250,250);
    image(MainC,275,360,250,250);
    image(MainE,525,360,250,250);
    image(MainA,775,360,250,250);
    image(MainB,1025,360,250,250);
  }
  else if(state==2){
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
    if(hp<=0) state=3;
  }
  else if(state==3){
    background(0);
    fight.stop();
    textSize(100);
    stroke(10);
    text("Score:"+score,740,360);
    textFont(killFont);
    text("遊戲結束",440,200);
    text("擊殺數:"+kill,125,360);
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
boolean BGM = false;
void mousePressed(){
  if(state==1){
    if(testInside(50,360,200,200)) { state=2; MainMain = Main4; }//MainMain玩家選擇的角色
    if(testInside(300,360,200,200)) { state=2; MainMain = Main3; }
    if(testInside(550,360,200,200))  { state=2; MainMain = Main5; }
    if(testInside(800,360,200,200))  { state=2; MainMain = Main; }
    if(testInside(1050,360,200,200))  { state=2; MainMain = Main2; }
    BGM = true;
    if(BGM==true) fight.play();
  }
}
void mouseReleased(){
  if(state==0) state=1;
  if(state==2){
    b.add(new Bullet(px,py,degrees(a),5,0));
    shoot.play();
  }
}
