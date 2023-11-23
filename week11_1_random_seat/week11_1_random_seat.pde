void setup(){
  size(600,400); 
}
void draw(){
  background(255);
  for(int i=0;i<4;i++){
    for(int j=0;j<6;j++){
      rect(j*100,i*100,100,100); 
    }
   }
}
