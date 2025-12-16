class Ball {

  float posX;
  float posY;
  float velX;
  float velY;
  color defColor;
  float size;

  color currentColor;

  Ball(color _c, float _s) {

    defColor = _c;
    currentColor = defColor;
    size = _s;
    start();
  }
  
  void start(){
    velX = random(-5, 5);
    velY = random(-5, 5);
    posX = width/2;
    posY = height/2;
  
  }

  void update() {

    posX += velX;
    posY += velY;
    if ( posX > width  ) {
      println("gol player 1");
      start();
    }
    else if ( posX < 0 ){
      println("gol player 2");
     start();
    }
    if ( posY > height - size*0.5 || posY < size*0.5 ) {
      velY = -velY;
    }
  }

  void display() {
    fill(currentColor);
    circle(posX, posY, size);
  }
  
  void checkPlayer(Player p){
  
    if ( abs( posX - p.x ) < p.w *0.5 + size*0.5 && abs(posY -p.y ) < p.h*0.5 + size*0.5 ){
        velX = -velX;
    }
    
  }
}
