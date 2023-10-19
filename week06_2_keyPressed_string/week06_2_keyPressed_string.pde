void setup(){
  size(500,500);
  textSize(64);
}
String line = "input:";

void draw(){
  text(line, 100, 100);
}
void keyPressed(){
  line += key;
}
