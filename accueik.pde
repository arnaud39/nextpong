float x2, y2, w2, z2, w3, z3, deplacementX2, deplacementY2;
int R, G, B;

void accueil()
{

  if (music == false && accson == false)
 { 
    //song = minim.loadFile("accueil.mp3");
    //song.loop();
    music = true;
    accson = true;

    
  }  scorePrinted = false;
  scorePrint = false;
  font = loadFont("Brandish-100.vlw");
  textFont(font, 32); 
  background(8, 58, 78);
   fill(22, 31, 40);
   stroke(44, 62, 80);
  textFont(font, 170);
  textAlign(CENTER);
  fill(236, 240, 241);
  text("NEXT PONG", displayWidth/2, displayHeight/4.9);
  
   textFont(font, 100);
  text("TAP TO START...", displayWidth-displayWidth/2.4, displayHeight/1.37);
  text("BEST SCORE: " + highscore, displayWidth/5, displayHeight/1.1);

  nettoyerAccueil();
 bouger2();
 BOTrebondir();
 //deplacementFourbe();
 dessiner2(); 
  
  
   if(mousePressed){ jeu = true;}
}


void nettoyerAccueil() {
  smooth(8);
  fill(255);
  noStroke();
 
  if (R<254) {R++;}
  if (G>25){G--;}
  if (B>20) {B--;}
  background(R, G, B);
  textFont(font, 170);
  textAlign(CENTER);
  fill(236, 240, 241);
  text("NEXT PONG", displayWidth/2, displayHeight/4.9);
  //image(play,displayWidth/2.8,displayHeight/1.5,displayHeight/15,displayHeight/15); 
   textFont(font, 100);
  text("TAP TO START...", displayWidth-displayWidth/5, displayHeight/1.1);
  text("BEST SCORE: " + highscore, displayWidth/5, displayHeight/1.1);
}
void dessiner2()
{
   
 noStroke();
 smooth(8);
 fill(255);
 rectMode(CENTER);
 rect(w2,z2,displayWidth/50,displayHeight/6.6);
 rect(w3,z3,displayWidth/50,displayHeight/6.6);
 fill(255);
 ellipse(x2,y2,displayHeight/30,displayHeight/30);
 

    
}
void bouger2()
{
  
  x2 += deplacementX2;
  y2 += deplacementY2;
 // z2 = (y2);
  z3 = (y2);
  z2 = (y2);
  
  
  //if (x2 <= displayWidth/2) { z2 = (y2-height/10); }
  //else {             }
  //if (x2 >= displayWidth/2) {z3 = (y2-height/10); }
}
void BOTrebondir()
{
  if (x2 > width-width/40 && deplacementX2 >0) //trop a droite
  {deplacementX2 = -deplacementX2;}
  if (y2 > height-displayHeight/4 && deplacementY2<displayHeight/10)//trop bas
  {deplacementY2 = -deplacementY2;}
  if (y2 < displayHeight/4 && deplacementY2 <displayHeight/40)//trop haut
  {deplacementY2 = abs(deplacementY2);}
  if (x2<w2+displayWidth/20 && y2<z2+displayHeight/12  && y2>z2-displayHeight/12)
  {deplacementX2 = abs(deplacementX); deplacementX2 += 25; deplacementY2 -= 15;}
  if (x2>w3-displayWidth/36.5/* && y2<z3 && y2<z3+displayHeight/12*/)
  {deplacementX2 = -deplacementX2; deplacementX2 -= 100;}
}
