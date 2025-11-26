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
    posX = random(0, width);
    posY = random(0, height);
    velX = random(-5, 5);
    velY = random(-5, 5);
  }

  void update() {

    posX += velX;
    posY += velY;
    if ( posX > width || posX < 0 ) {
      velX = -velX;
    }
    if ( posY > height || posY < 0 ) {
      velY = -velY;
    }
  }

  void display() {
    fill(currentColor);
    circle(posX, posY, size);
  }
  
  void checkPlayer(Player p){
  
    if  ( posX - size*0.5 < p.x + p.w*0.5 && posX + size*0.5 > p.x - p.w*0.5 
    && posY - size*0.5 < p.y + p.h*0.5 && posY + size*0.5 > p.y - p.h*0.5 ) {
    
        velX = -velX;
        velY = -velY;
    }
    
  }

  boolean checkBall(Ball b) {

    float dist = dist(posX, posY, b.posX, b.posY);
    
    if ( dist < size*0.5 + b.size*0.5 ) {
      currentColor = color(255, 0, 0);
      velX = -velX;
      velY = -velY;
      return true;
      
    } else {
      currentColor = defColor;
      return false;
    }
  }
}
