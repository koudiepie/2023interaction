ArrayList<PVector>pt;//大的資料結構
void setup(){
  size(400,400,P3D);
  pt = new ArrayList<PVector>();//初始化，把大的資料結構準備好(裡面要放小的資料結構)
  for(int i=0;i<20;i++){
    pt.add( new PVector(i*20, 20) );//假設畫面點好20個頂點
  }
}
void draw(){
  background(#39C5BB);
  for(PVector p : pt){ //畫出20個頂點
    ellipse(p.x, p.y, 10, 10);
  }
  if(ans!=null) ellipse(ans.x, ans.y, 15, 15);
}
PVector ans = null;
void mousePressed(){
  for(PVector p : pt){
    if(dist(p.x,p.y,mouseX,mouseY)<5){
      ans = p;
    }
  }
}
