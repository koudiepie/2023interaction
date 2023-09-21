PImage img;
void setup(){
  size(600,600);
  img = loadImage("urahara2.jpg");
}

void draw(){
  image(img, mouseX, mouseY, 300,300);
}
