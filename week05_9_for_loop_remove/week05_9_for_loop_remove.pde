ArrayList<PVector>pt;//大的資料結構
void setup(){
  size(400,400,P3D);
  pt = new ArrayList<PVector>();//初始化，把大的資料結構準備好(裡面要放小的資料結構)
  for(int i=0;i<37;i++){
    pt.add( new PVector(random(400), random(400) ) );//假設畫面點好37個頂點
  }
}
void draw(){
  background(#39C5BB);
  for(PVector p : pt){ //畫出全部的頂點
    ellipse(p.x, p.y, 10, 10);
  }
  if(ans!=null) ellipse(ans.x, ans.y, 15, 15);
}
PVector ans = null;
void mouseDragged(){//拖曳
  if(mouseButton==CENTER && ans!=null){
    ans.x = mouseX;
    ans.y = mouseY;
  }
}
void mousePressed(){//點擊
  if(mouseButton==LEFT) pt.add( new PVector(mouseX,mouseY) );
  else if(mouseButton==CENTER){
    for(PVector p : pt){
      if(dist(p.x,p.y,mouseX,mouseY)<5){
        ans = p;
       }
    }
  }else if(mouseButton==RIGHT){//右鍵，要刪除，要用傳統的for迴圈
    for(int i=0;i<pt.size();i++){//要寫2行，才等於特殊的1行
      PVector p = pt.get(i);//2行
      if(dist(p.x, p.y, mouseX, mouseY) < 5 ){//找到夠近的點
        pt.remove(i);//把第i個點刪掉(刪的時候，會把大資料結構右邊的都左移一格)
      }
    }
  }
}
