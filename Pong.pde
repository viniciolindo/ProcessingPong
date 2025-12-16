Player p1; // Racchetta sinistra
Player p2; // Racchetta destra

Ball b;

boolean wPressed;
boolean sPressed;
boolean upPressed;
boolean downPressed;

void setup() {
  size(800, 600);
  
  // --- Inizializzazione tramite Costruttore ---
  // P1 a sinistra (distante 30px dal bordo)
  p1 = new Player(30); 
  
  // P2 a destra (distante 30px dal bordo destro)
  p2 = new Player(width - 30); 
  
  b = new Ball(color(255),30);
  
  wPressed = false;
  sPressed = false;
  upPressed = false;
  downPressed = false;
}

void draw() {
  background(0);
  
  // Disegna e (opzionale) mostra punteggio
  p1.show();
  p2.show();
  
  // Gestione Movimento Fluido
  // Questo blocco permette di muovere entrambi contemporaneamente

  // Controlli Giocatore 1 (Sinistra - W/S)
  if ( wPressed ) p1.moveUp();
  if ( sPressed ) p1.moveDown();
  
  // Controlli Giocatore 2 (Destra - Frecce)
  if (upPressed) p2.moveUp();
  if (downPressed) p2.moveDown();
  
  
  // Qui disegneresti la pallina...
  b.update();
  b.checkPlayer(p1);
  b.checkPlayer(p2);
  b.display();
}


void keyPressed(){
    
  if ( key == 'w') wPressed = true;
  else if ( key == 's' ) sPressed = true;
  else if ( keyCode == UP ) upPressed = true;
  else if ( keyCode == DOWN ) downPressed = true;
  
}

void keyReleased(){
  
  if ( key == 'w') wPressed = false;
  else if ( key == 's' ) sPressed = false;
  else if ( keyCode == UP ) upPressed = false;
  else if ( keyCode == DOWN ) downPressed = false;
}
