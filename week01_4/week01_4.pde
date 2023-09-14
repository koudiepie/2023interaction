void setup(){
  size(500,500);
  background(255);//白色背景
}

void draw(){
  if(mousePressed){//按下滑鼠
    line(mouseX, mouseY,pmouseX,pmouseY);
  }//畫線(滑鼠座標到之前的滑鼠座標)
}
void keyPressed(){//按下鍵盤
  if(key=='1') stroke(255,0,0);//筆變紅色
  if(key=='2') stroke(0,255,0);//筆變綠色
  if(key=='3') stroke(0,0,255);//筆變藍色
  if(key=='s'||key=='S') save("output.png");//按S鍵存檔
}
