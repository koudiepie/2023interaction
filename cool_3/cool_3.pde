void setup(){
  size(1000,600);
  b = new ArrayList<Bullet>();
  e = new ArrayList<Enemy>();
}
float px=500,py=300,pr = 15;
float a = 0;
ArrayList<Bullet>b;
ArrayList<Enemy>e;
class Enemy{
 float x,y,speed;
 int pattern;
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
   x += cos(r)*speed;
   y += sin(r)*speed;
   fill(255,0,0);
   ellipse(x,y,20,20);
   if(second % 60 ==0){
     b.add(new Bullet(x,y,r,5,1));
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
     if(dist(px,py,x,y)<5 + pr){
       delete = 1;  
     }
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
  for(int i=0;i<b.size();i++){
    b.get(i).move();
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
}
