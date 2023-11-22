void setup(){
  size(1000,600);
  b = new ArrayList<Bullet>();
}
float px=500,py=300,pr = 15;
float a = 0;
ArrayList<Bullet>b;
class Bullet{//子彈
 float x,y,r,speed;//座標，角度，速度
 int pattern;
 Bullet(float x,float y,float r,float speed,int pattern){
   this.x=x;//子彈X
   this.y=y;//子彈Y
   this.r=radians(r);//子彈角度
   this.speed=speed;//子彈速度
   this.pattern = pattern;
 }
 void move(){
   x += r*speed;
   y += r*speed;
   if(pattern != 0){
     fill(255,0,0);
     noStroke();
   }else{
     fill(255,255,0);
     noStroke();
   }
   ellipse(x,y,10,10);
 }
}
void draw(){
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
  rotate(a);
  stroke(0);
  strokeWeight(10);
  line(0,0,30,0);//砲管
  rotate(-a);
  translate(-px,-py);
  stroke(0);
  strokeWeight(3);
  fill(#39C5BB);
  ellipse(px,py,pr*2,pr*2);//玩家
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
