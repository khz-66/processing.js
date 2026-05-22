void setup() {
  size(400, 400); 
  noStroke();
}

void draw() {
  // Dunkler Hintergrund mit leichtem Schweif-Effekt
  fill(17, 17, 17, 40);
  rect(0, 0, width, height);
  
  // Blauer Kreis folgt dem Finger / der Maus
  fill(0, 150, 255);
  ellipse(mouseX, mouseY, 50, 50);
  
  // Weißer Kern
  fill(255);
  ellipse(mouseX, mouseY, 10, 10);
}
