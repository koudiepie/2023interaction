void setup(){
  size(400,400);
}
int [][] card = new int[8][11];
color [] C = {#FF5555, #FFAA00, #55AA55, #5555FF};
void draw(){
  background(255);
  for(int i=0;i<8;i++){
    for(int j=0;j<11;j++){
      drawCard(j*32, i*50, C[i%4], j);
    }
  }
}
void drawCard(int x, int y, color C, int n){
  stroke(128);//灰色
  fill(255);//白
  rect(x, y, 32, 50, 7);
  noStroke();
  fill(C);
  rect(x+3, y+3, 32-5, 50-5, 4);
  
  pushMatrix();
  fill(255);//填白色
  translate(x+16, y+25);//移到中心點
  rotate(radians(45));//如無旋轉，橢圓會是直立的
  ellipse(0, 0, 20, 30);//橢圓形
  popMatrix();
  
  textAlign(CENTER,CENTER);
  textSize(10);//大小
  text(""+n, x+7, y+6);//左上的字
  
  textSize(18);//字大小
  fill(C);//上色
  text(""+n, x+16, y+22);//中間的字
}
