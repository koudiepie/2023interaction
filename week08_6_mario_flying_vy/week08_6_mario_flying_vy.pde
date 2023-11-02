//牛頓力學碰撞偵測
void setup(){
  size(400,400);
}
float marioX=50, marioY=250,vx=0,vy=0;
void draw(){
  background(108,137,255);
  marioX += vx;
  if(flying){//如果飛行中
    marioY += vy;//上下位置改變
    vy += 0.98;//重力加速度往下
    if(marioY>=250){//碰到地板
      marioY = 250;//站在地板上
      flying = false;//不再飛行
    }
  }
  fill(255,0,0); ellipse(marioX,marioY,15,20);
  fill(229,119,42); rect(0,260,400,150);
}
boolean flying = false;//一開始不飛
void keyPressed(){
  if(keyCode==RIGHT) vx=2;
  if(keyCode==LEFT) vx=-2;
  if(keyCode==UP && flying==false){//禁止多段跳
    vy= -20;
    flying = true;//飛行 啟動
  }
}
void keyReleased(){
  if(keyCode==LEFT || keyCode==RIGHT) vx=0;  
}
