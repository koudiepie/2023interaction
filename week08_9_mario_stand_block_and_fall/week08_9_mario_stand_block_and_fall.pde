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
  fill(229,119,42); rect(200,150,20,20);
  if(hitbox(200,150,20,20)){
    if(vy>0){
      marioY = 150-10;//往上
      flying = false;
      stand_box = true;
    }else{
      vy = 0;
      marioY=150+20+10;//往下
     }
  }
  if(stand_box==true && flying==false && leavebox(200,150,20,20)){
      stand_box = false;
      flying = true;
      vy = 0;
    }
}
boolean leavebox(int x,int y,int w,int h){
  if(x-7>marioX || marioX>x+w+7) return true;
  else return false;
}
boolean hitbox(int x,int y,int w,int h){
  if(x-7<marioX && marioX<x+w+7 && y-10<marioY && marioY<y+h+10) return true;
  else return false;
}
boolean flying = false,stand_box = false;//一開始不飛
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
