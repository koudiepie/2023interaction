void setup(){
  size(500,500);
  for(int i=0;i<40;i++){
    x[i] = random(500);
    y[i] = random(500);
    dx[i] = random(-1,+1);//亂數跑
    dy[i] = random(-1,+1);//亂數跑
  }
}
float [] x = new float[40];
float [] y = new float[40];
float [] dx = new float[40];
float [] dy = new float[40];
void draw(){
  background(0);
  for(int i=1;i<40;i++){
    ellipse(x[i], y[i], 5, 5);
    for(int k=0;k<i;k++){
      stroke(20, 155, 205);//線上顏色
      if(dist(x[i],y[i], x[k],y[k])<100)
        line(x[i],y[i], x[k],y[k]);
    }
    x[i] += dx[i];
    y[i] += dy[i];
    if(x[i]<0 || x[i]>500) dx[i] = -dx[i];//碰到邊緣即反彈
    if(y[i]<0 || y[i]>500) dy[i] = -dy[i];//碰到邊緣即反彈
  }
}
