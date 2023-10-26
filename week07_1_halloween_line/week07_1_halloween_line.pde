void setup(){
  size(400,400);
  background(255);
}
void draw(){
  if(mousePressed) line(mouseX, mouseY, pmouseX, pmouseY);
}
void mouseReleased(){//鬆開滑鼠
  background(255);//重填背景
}
