int state = 0;
void setup(){
  size(400,400);
}
int x =50,y=50,t=100;
void draw(){
  if(state==0){//第0關白色
    background(255);
    textSize(30);
    fill(0); text("Click to  start",80,200);
    x = 50;
  }else if(state==1){//第1關紅色
    background(255,0,0);
    fill(255); rect(300,50,50,50);//目標位置
    fill(128); rect(x,y,50,50);//灰色方塊
    t = 100;
  }else if(state==2){//第2關藍色
    background(0,0,255);
    fill(255,255,0); text("wait "+t, 80, 200);
    
    t--;
    if(t==0) state =0;
  }
}
void mousePressed(){
  if(state==0) state=1;
}
void keyPressed(){
  if(state==1 && keyCode==RIGHT){
    x += 10;//向右移動十步
    if(x==300) state=2;//灰色方塊到目標換第2關
  }
}
