void setup(){
  size(1000,1000);
  myShuffle();
}
void myShuffle(){
  for(int i=0;i<8;i++){
    for(int j=0;j<11; j++){
      cardN[i*11+j] = j;
      cardC[i*11+j] = C[i%4];
    }
  }
  for(int i=0; i<10000; i++){
    int a = int(random(88)), b = int(random(88));
    int temp = cardN[a];
    cardN[a] = cardN[b];
    cardN[b] = temp;
    temp = cardC[a];
    cardC[a] = cardC[b];
    cardC[b] = temp;
  }
}
//int [][] card = new int[8][11];
int [] cardN = new int[88];
int [] cardC = new int[88];
color [] C = {#FF5555, #FFAA00, #55AA55, #5555FF};
void draw(){
  background(255);
  if(mousePressed && mouseButton==RIGHT){//view deck偷看牌組
    for(int i=0;i<8;i++){
      for(int j=0;j<11;j++){
        drawCard(j*32, i*50, cardC[i*11+j], cardN[i*11+j], 32);
      }
    }
  }else drawCard(50, 50, #000000, 99,128);//deck牌組
  for(int i=0;i<myCard;i++){
    if(i%4==0) drawCard(430 +40*i/4,50, cardC[i], cardN[i], 128);//玩家1拿牌
    if(i%4==1) drawCard(630 +40*i/4,350, cardC[i], cardN[i], 128);//玩家2拿牌
    if(i%4==2) drawCard(430 +40*i/4,650, cardC[i], cardN[i], 128);//玩家3拿牌
    if(i%4==3) drawCard(230 +40*i/4,350, cardC[i], cardN[i], 128);//玩家4拿牌
  }
}
int myCard = 0;
void mousePressed(){
  if(mouseButton==LEFT) myCard++;
}
void drawCard(int x, int y, color C, int n, int w){
  float s = w/32.0;//放大倍率
  stroke(128);//灰色
  fill(255);//白
  rect(x, y, 32*s, 50*s, 7*s);
  noStroke();
  fill(C);
  rect(x+2.5*s, y+2.5*s, 32*s-5*s, 50*s-5*s, 4*s);
  
  pushMatrix();
  fill(255);//填白色
  translate(x+16*s, y+25*s);//移到中心點
  rotate(radians(45));//如無旋轉，橢圓會是直立的
  ellipse(0, 0, 20*s, 30*s);//橢圓形
  popMatrix();
  
  textAlign(CENTER,CENTER);
  textSize(10*s);//大小
  text(""+n, x+7*s, y+6*s);//左上的字
  
  textSize(18*s);//字大小
  fill(C);//上色
  text(""+n, x+16*s, y+22*s);//中間的字
}
