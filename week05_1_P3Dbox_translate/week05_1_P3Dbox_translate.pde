void setup(){
  size(400,400, P3D);//processing 3D功能
}
void draw(){
  background(#39C5BB);
  pushMatrix();//備份矩陣
    translate(mouseX, mouseY);//移動
    box(100);//3D盒子
  popMatrix();//還原矩陣
}
