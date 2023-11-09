PImage img;
int [][] pos ={{92,491},{245,525},{173,526},{159,491},{153,457},{194,491},{228,491},{263,489},{322,456},{298,491},{331,491},{366,490},{313,524},{279,524},{358,456},{390,457},{82,455},{186,456},{127,490},{219,457},{289,457},{211,523},{116,457},{143,522},{253,457},{109,524}};
void setup(){
  size(800,600);
  img = loadImage("keyboard.png");
  rectMode(CENTER);//用中心點，來畫四邊形
}
void draw(){
  background(#FFFFF2);//淡黃色，清背景
  image(img, 0, 600-266);
  fill(255,0,0, 128);//半透明紅色;
  rect(mouseX,mouseY,28,30,5);
  fill(0,255,0, 128);//半透明綠色
  for (int i=0; i<26; i++){
    if(id<typing.length()&&typing.charAt(id)-'a' ==i) rect(pos[i][0], pos[i][1], 28, 30, 5);
    if(pressed[i]) rect(pos[i][0], pos[i][1], 28, 30, 5);
  }
  fill(0);
  textSize(30);
  text(typing,50,50);//要打的字
  fill(255,0,0);//紅色
  if(id<typing.length()) text(typed + typing.charAt(id), 50,100);//現在要打的字，是typing.charAt(0)
  fill(0);//再用黑色秀出已經打好的字
  text(typed,50,100);//已經打好的字
}
String typing = "printf";
String typed = "";//一開始打0個字
int id = 0;//第幾個字母要被打
boolean [] pressed = new boolean[26];
void keyPressed(){
  if(key>='a'&&key<='z'){
    if(id<typing.length()&&key == typing.charAt(id)){//字母正確才往下
      pressed[key-'a'] = true;
      typed += key;
      id++;
    }else{
      background(255,0,0);//紅色背景閃爍
    }
  }
}
void keyReleased(){
  if(key>='a'&&key<='z') pressed[key-'a'] = false;
}
