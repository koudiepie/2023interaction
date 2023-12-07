import processing.sound.*;
PImage Main;

SoundFile fight,shoot;

void setup(){
  size(1280,720);
  fight = new SoundFile(this, "fight.mp3");
  shoot = new SoundFile(this, "shoot2.mp3");
  fight.play();
  Main = loadImage("Main.png");
  b = new ArrayList<Bullet>();
  e = new ArrayList<Enemy>();
}
float px=500,py=300,pr = 15;
float a = 0;
ArrayList<Bullet>b;
ArrayList<Enemy>e;
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
   }
 }
}
int hp = 100,hp_max = 100;
int second = 0;
int state = 0;
void draw(){
  if(state==0){
    
  }
  else if(state==1){
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
    image(Main,px,py,50,50);//玩家
    for(int i=0;i<b.size();i++){
      b.get(i).move();
      if(b.get(i).delete == 1){
        b.remove(i);
      }
    }
    if(second % 60 == 0){
      e.add(new Enemy(random(width),random(height),0.6,0)); 
    }
    for(int i=0;i<e.size();i++){
      e.get(i).move();
      if(e.get(i).delete == 1){
        e.remove(i);
      }
    }
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
void mouseReleased(){
  b.add(new Bullet(px,py,degrees(a),5,0));
  shoot.play();
}
