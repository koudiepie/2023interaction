void setup(){
  size(400,400, P3D);//processing 3D功能
}
void draw(){
  background(#39C5BB);
  pushMatrix();//備份矩陣
    translate(mouseX, mouseY);//移動
    rotate(radians(mouseX));//對Y軸轉動
    fill(255, 0, 0);
    box(100);//3D盒子
    
    noFill();//不填充顏色
    scale(2);//放大兩倍
    box(100);
  popMatrix();//還原矩陣
}
