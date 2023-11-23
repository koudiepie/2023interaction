int state = 0;
void setup(){
  size(400,400);
}
void draw(){
  if(state==0){//第0關白色
    background(255);
    textSize(20);
    fill(0); text("Click to  start",80,200);
  }else if(state==1){//第1關紅色
    background(255,0,0);
  }else if(state==2){//第2關藍色
    background(0,0,255);
  }
}
void mousePressed(){
  if(state==0) state=1;
}
