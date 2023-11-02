//牛頓力學碰撞偵測
void setup(){
  size(400,400);
}
float x=50,y=250,vx=2,vy=-20;
void draw(){
  x += vx;
  y += vy;
  vy += 0.98;//重力加速度
  if(y>350){//利用if判斷，看有沒有到y=350的地板
    y=350;
    vy = -vy *0.6;//反方向彈，能量耗損，速度變慢
    vx = vx * 0.6;
  }
  ellipse(x, y, 10,10);
}
