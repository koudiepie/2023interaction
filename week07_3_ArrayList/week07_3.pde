ArrayList<PVector> pt = new ArrayList<PVector>();
void setup(){
  size(400,400);
  background(255);
}
float ghostX=400,ghostY=20;
void mouseDragged(){
  pt.add( new PVector(mouseX,mouseY));
}
void draw(){
  //if(mousePressed) line(mouseX, mouseY, pmouseX, pmouseY);
  background(255);
  ellipse(200,100,15,15);
  for(int i=0;i<pt.size();i++){
    PVector p = pt.get(i);
    ellipse(p.x,p.y, 3, 3);
  }
  
  ellipse(ghostX,ghostY,15,15);
  float dx= 200-ghostX, dy = 200-ghostY, len = sqrt(dx*dx+dy*dy);
  ghostX += dx / len / 3;
  ghostY += dy / len / 3;
}
void mouseReleased(){//鬆開滑鼠
  background(255);//重填背景
}
