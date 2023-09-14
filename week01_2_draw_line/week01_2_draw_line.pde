void setup(){
  size(500,500);
  background(255);//白色背景
}

void draw(){
  if(mousePressed){//按下滑鼠
    line(mouseX, mouseY,pmouseX,pmouseY);
  }//畫線(滑鼠座標到之前的滑鼠座標)
}
