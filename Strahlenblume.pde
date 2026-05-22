// Klasse Strahlenblume
//
// Konstruktor
//
// Strahlenblume(PVector Position, float Größe) oder
// Strahlenblume(X-Koordinate, Y-Koordinate, float Größe)
//
// Umriss ist standardmäßig schwarz, Farbe und Drehwinkel zufällig
//
// .setzen()                            - Blume anzeigen
//
// .x, .y,                              - Variable Typ float: Koordinaten Position, auch: .position.x 
// .position                            - Variable Typ PVector: Position Ortsvektor
// .rotation                            - Variable Typ float: Blume drehen lassen
// .farbe                               - Variable Typ color: Farbe der Blume
// .farbeLinie                          - Variable Typ color: Linienfarbe der Blume
// .staerkeLinie                        - Variable Typ float: Liniendicke
// .drehung                             - Variable Typ float: Anfängliche Stellung der Strahlen 
// .groesse                             - Variable Typ float: Durchmesser der Blume


class Strahlenblume {

  int anzahl = 5;                       //Anzahl der "Blütenblätter"
  float alpha = TWO_PI/anzahl;          //Winkel zwischen den "Blütenblättern"
  float drehung=random(alpha);          //Winkel-Offset
  float x, y;                           //Position als Koordinaten
  PVector position;                     //Position als PVektor
  float groesse;                        //Größe 
  float laenge;                         //absolute Länge der Strahlen
  float staerkeLinie;                   //Liniendicke
  float [] strahl = new float [anzahl]; //relative Länge der Strahlen als Array
  
  float rotation = 0;                   //drehgeschwindigkeit
  
  color farbe= color(random(255),           
                   random(255), 
                   random(255));        //Füllfarbe
    
  color farbeLinie = 0;                 //Linienfarbe
  
  // Konstruktor für PVektor 
  Strahlenblume (PVector tempPos, float tempSize){
    
    x = tempPos.x;
    y = tempPos.y;
    
    groesse = tempSize;
    staerkeLinie=groesse/20;
    
    strahl[0]=random(0.7,1.3);          //relative Länge der Strahlen festlegen
    strahl[1]=random(0.7,1.3);
    strahl[2]=random(0.7,1.3);
    strahl[3]=random(0.7,1.3);
    strahl[4]=random(0.7,1.3);
  }
  
  // Konstruktor für x,y-Koordinaten 
  Strahlenblume (float tempX, float tempY, float tempSize){
    
    x = tempX;
    y = tempY;
    
    groesse = tempSize;
    staerkeLinie=groesse/20;
    
    strahl[0]=random(0.7,1.3);          //relative Länge der Strahlen festlegen
    strahl[1]=random(0.7,1.3);
    strahl[2]=random(0.7,1.3);
    strahl[3]=random(0.7,1.3);
    strahl[4]=random(0.7,1.3);
  }
  
  //Methode Darstellung Blume
  void setzen() {
    strokeWeight(staerkeLinie);
    stroke(farbeLinie);
    fill(farbe);
    
    for (int i=0; i<anzahl; i++) {
      laenge=groesse*strahl[i];         //absolute Länge der Strahlen festlegen
      line(x, y, x+laenge*cos(i*alpha+drehung), y+laenge*sin(i*alpha+drehung));
      ellipse(x+laenge*cos(i*alpha+drehung), y+laenge*sin(i*alpha+drehung), laenge*0.6, laenge*0.6);
    }
    drehung=drehung+rotation%TWO_PI;
  } 
}
