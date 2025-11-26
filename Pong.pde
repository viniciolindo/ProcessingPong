Player p1; // Racchetta sinistra
Player p2; // Racchetta destra

Ball b;

void setup() {
  size(800, 600);
  
  // --- Inizializzazione tramite Costruttore ---
  // P1 a sinistra (distante 30px dal bordo)
  p1 = new Player(30); 
  
  // P2 a destra (distante 30px dal bordo destro)
  p2 = new Player(width - 30); 
  
  b = new Ball(color(255),30);
}

void draw() {
  background(0);
  
  // Disegna e (opzionale) mostra punteggio
  p1.show();
  p2.show();
  
  // Gestione Movimento Fluido
  // Questo blocco permette di muovere entrambi contemporaneamente
  if (keyPressed) {
    // Controlli Giocatore 1 (Sinistra - W/S)
    if (key == 'w' || key == 'W') p1.moveUp();
    if (key == 's' || key == 'S') p1.moveDown();
    
    // Controlli Giocatore 2 (Destra - Frecce)
    if (keyCode == UP) p2.moveUp();
    if (keyCode == DOWN) p2.moveDown();
  }
  
  // Qui disegneresti la pallina...
  b.update();
  b.checkPlayer(p1);
  b.checkPlayer(p2);
  b.display();
}
