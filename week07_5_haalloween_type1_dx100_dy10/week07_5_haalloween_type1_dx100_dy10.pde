ArrayList<PVector> pt = new ArrayList<PVector>();
void setup(){
  size(400,400);
  background(255);
}
float ghostX=40,ghostY=20;
void mouseDragged(){
  pt.add( new PVector(mouseX,mouseY));
}
void draw(){
  //if(mousePressed) line(mouseX, mouseY, pmouseX, pmouseY);
  background(255);
  ellipse(200,200,15,15);
  ellipse(ghostX,ghostY,15,15);
  strokeWeight(4);
  
  float dpx=0,dpy=0;
  for(int i=0;i<pt.size()-1;i++){
    PVector p = pt.get(i), p2 = pt.get(i+1);
    dpx += abs(p2.x - p.x);//X位移
    dpy += abs(p2.y - p.y);//Y位移
  }
  if(dpx>100 && dpy<40) stroke(255,0,0);//type1 red line
  //if(dpx>0 && dpy<0) stroke(0,0,255);//type 2 blue line
  else stroke(0);//否則黑色
  
  for(int i=0;i<pt.size()-1;i++){
    PVector p = pt.get(i), p2 = pt.get(i+1);
    line(p.x,p.y, p2.x, p2.y);
  }
  
  float dx= 200-ghostX, dy = 200-ghostY, len = sqrt(dx*dx+dy*dy);
  ghostX += dx / len / 3;
  ghostY += dy / len / 3;
}
void mouseReleased(){//鬆開滑鼠
  for(int i=pt.size()-1;i>=0;i--){//倒過來的for迴圈
    pt.remove(i);
  }
}
