Strahlenblume drehBlume, pulsBlume; 
Strahlenblume[][] kleineBlume;

float gross = 100.0;                //Größe der großen Blumen
float klein = 23;                   //Größe der kleinen Blume

PVector posDreh;                    //Position der drehenden Blume
float posPulsX, posPulsY;           //Position der pulsierenden Blume

int zeilen = 12;                    //Zeilen und Spalten für kleine Blumen
int spalten= 16;
float abstand = 60;                 //Abstand der kleinen Blumen

float puls = 0;                     //Faktor für pulsierende Blume

color rot = color(255,0,0);         //Farbe für pulsierende Blume


void setup(){
  size(800, 600);
  
  //kleine Blumen definieren/////////////////////////////////////////////////////////
  kleineBlume=new Strahlenblume[spalten][zeilen];    
  
  for(int c=0; c<spalten; c++){
    for(int r=0; r<zeilen; r++){
      PVector smallPos = new PVector(abstand*c, abstand*r); //Position jeder kleinen Blume als PVector als lokale Variable
      kleineBlume[c][r] = new Strahlenblume(smallPos,klein);
      kleineBlume[c][r].farbeLinie=255;
    }
  }
  
  //rotierende Blume definieren mit PVector////////////////////////////////////////
  posDreh = new PVector(width/3*2, height/2); //Position der rotierenden Blume 
  drehBlume = new Strahlenblume(posDreh, gross);
  drehBlume.farbeLinie=255;
  drehBlume.rotation=0.1;
  
  //pulsierende Blume definieren mit x- und y-Koordinaten/////////////////////////
  posPulsX=width/3;
  posPulsY=height/2;
  pulsBlume = new Strahlenblume(posPulsX, posPulsY, gross);
  pulsBlume.farbeLinie=255;
  pulsBlume.farbe=rot;
}


void draw(){
  background(0);
  
  //kleine Blumen im Hintergrund darstellen////////////////////////////////////////
  for(int c=0;c<spalten;c++){
    for(int r=0;r<zeilen;r++){
      kleineBlume[c][r].setzen();
    }
  }
  
  //rotierende Blume darstellen/////////////////////////////////////////////////////
  drehBlume.setzen();
  
  //pulsierende Blume darstellen////////////////////////////////////////////////////
  puls=gross/20*sin(frameCount*0.2);
  pulsBlume.groesse=gross+puls;
  pulsBlume.setzen();
}
