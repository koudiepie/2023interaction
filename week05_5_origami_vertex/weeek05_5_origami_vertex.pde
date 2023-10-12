ArrayList<PVector>pt;//大的資料結構
void setup(){
  size(400,400,P3D);
  pt = new ArrayList<PVector>();//初始化，把大的資料結構準備好(裡面要放小的資料結構)
}
void draw(){
  background(#39C5BB);
  for(PVector p : pt){ //特殊的for迴圈，得小資料結構
    ellipse(p.x, p.y, 10, 10);
  }
  beginShape();
  for(PVector p : pt){
    vertex(p.x, p.y);
  }
  endShape();
}
void mousePressed(){
  pt.add( new PVector(mouseX,mouseY) );//大的資料結構裡加入小的PVector的物件
}
