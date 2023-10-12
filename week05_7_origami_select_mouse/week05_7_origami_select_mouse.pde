void setup(){
  size(400,400,P3D);
}
void draw(){
  
  background(#39C5BB);
  
  if(mousePressed && mouseButton==LEFT) background(255,0,0);
  if(mousePressed && mouseButton==CENTER) background(0,255,0);
  if(mousePressed && mouseButton==RIGHT) background(0,0,255);
}
