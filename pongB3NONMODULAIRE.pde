/*import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;
AudioPlayer song;
 Minim minim;
 Minim gameover;
 */
// import android.view.WindowManager;
//import android.view.Window;
//import android.os.Bundle;

//Hide the navigation bar
/*@Override
public void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    requestWindowFeature(Window.FEATURE_NO_TITLE);
   this.getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN,WindowManager.LayoutParams.FLAG_FULLSCREEN);
}
*/
//rgb(52, 152, 219) rgb(243, 156, 18
float x, y, yBOT, w, z, a, deplacementX, deplacementY;
int score = 0;
boolean jeu = false, music; //lancer jeu
boolean firstStart, check , accson;
PFont font;
PImage  play;
PrintWriter Mscore;
boolean couleur = true;
int compteur;
int BalleStatu; // trajectoire parabollique
boolean Balle;
int Yfourbe;
int RR = 255;
int BB= 10;
int VV = 10;
Boolean RS = true;
int scoreM = 0;
boolean scorePrint = false;
boolean scorePrinted = false;
String highscoreFile = "highscore";



void renV ()
{
  
  
  BalleStatu = 0;
  Balle = false;
  compteur = 0;
  Yfourbe = 0;
  R = 243;//8;
  G = 156;//58;
  B = 18;//78;
  x = width/2; y=height/2;                                  //positon de la balle : Balle(x;y)
 float r = random(100);
 if ( r < 26 ) { 
  deplacementX = width/66;                                  //vitesse de deplacement horizontal de la balle
  deplacementY = height/-133; 
  }
 else if (r < 51){
  deplacementX = width/66;                                  //vitesse de deplacement horizontal de la balle
  deplacementY = height/133;  
  }
 else if (r < 76){
  deplacementX = width/-66;                                  //vitesse de deplacement horizontal de la balle
  deplacementY = height/133;  
 }
 else {
  deplacementX = width/-66;                                  //vitesse de deplacement horizontal de la balle
  deplacementY = height/-133;  
 }

                             //vitesse de déplacement verticale de la balle
  w = width/26; z = height/2;                               //taille de la raquette
  x2 = width/2; y2 = height/2;                              //variables BOTS
  deplacementX2 = width/66;
  deplacementY2 = height/-133;
  w2 = width/26; z2 = height/3;
  w3 =  width-width/18; z3 = height-height/3;
  //firstStart = false;

  check = false;

}
void setup()
{ // Open the file from the createWriter()
  music = false;
  reader = createReader("highscore.txt");  
  importHighscore();  
//  minim = new Minim(this);
  //gameover = new Minim(this);
  BalleStatu = 0;
  Balle = false;
  compteur = 0;
  Yfourbe = 0;
  R = 243;//8;
  G = 156;//58;
  B = 18;//78;
  size(displayWidth,displayHeight); orientation(LANDSCAPE); //definiton de la résolution du jeu
  background(8, 58, 78);                                    //couleur de fond initiale
    x = width/2; y=height/2;                                  //positon de la balle : Balle(x;y)
  float r = random(100);
  if ( r < 26 ) { 
    deplacementX = width/66;                                  //vitesse de deplacement horizontal de la balle
    deplacementY = height/-133; 
  }
  else if (r < 51){
   deplacementX = width/66;                                  //vitesse de deplacement horizontal de la balle
   deplacementY = height/133;  
  }
  else if (r < 76){
   deplacementX = width/-66;                                  //vitesse de deplacement horizontal de la balle
   deplacementY = height/133;  
  }
  else {
   deplacementX = width/-66;                                  //vitesse de deplacement horizontal de la balle
   deplacementY = height/-133;  
  }                              //vitesse de déplacement verticale de la balle
  w = width/26; z = height/2;                               //taille de la raquette

  x2 = width/2; y2 = height/2;                              //variables BOTS
  deplacementX2 = width/66;
  deplacementY2 = height/-133;
  w2 = width/26; z2 = height/3;
  w3 =  width-width/18; z3 = height-height/3;

 firstStart = false;
 check = false;


}

void draw()
{
  //sauvegarde
  /* if (key == ESC || key == ESC) {
      output.flush(); // Writes the remaining data to the file
      output.close(); // Finishes the file
      exit();
    }*/
  //
if (jeu == false) //ecran d'accueil au premier lancement et après un game over
 {
   
   accueil();   

 }

else if (jeu == true)//jeu, fonction qui tourne en boucle
 {
   if (accson == true && music == true){
   /* minim.stop();
     song = minim.loadFile("jeu.mp3");
    song.loop();*/
    accson = false;
  }  
 jeu = true;
 scoreM = 0;
  if (mousePressed) {frameRate(60);} else {frameRate(5);}
  if (firstStart == true) {firstStart = false; x = width/2; y=height/2;  //petit temps avant l'activation du déplacement de la balle et mise en place de celle-ci au milieu de l'ecran
   w = width/26; z = height/2; delay(750);}
 background();
 nettoyer();
 bouger();
 rebondir();
 dessiner(); 
 if (check == false) {firstStart = true; check = true;}
    if (scorePrint == true) {
      updateHighscore();
      textSize(50);
      text("" + score + " rebond" + (score>1 ? "s " : "" ), width/2, height/2);
     // song = minim.loadFile("gameover.wav");
     // song.play();
      if (scorePrinted == true){
        jeu = false;
        score = 0;
        delay(1000);
       
        renV();}
      scorePrinted = true; }}}

void background()
{if ( R == 243 && G == 156 && B == 18) { compteur++; if (compteur == 1200) {compteur = 0; couleur = true;}} //couleur de fond qui varie
else if (R == 8 && G == 58 && B == 78) { compteur++; if (compteur == 1000) {couleur = false; compteur = 0;}}
if (couleur == true) {
   if (R>8) {
     R--;}
   if (G>58){ 
   G--;}
   if (B<78){
    B++;}
  }
if (couleur == false) {
 if(R<243) {R ++;} if (G<156){ G++;} if (B>18){ B--;}}
 }
void nettoyer() {

if (mousePressed) {background(R, G, B);} 
else {
background(R/2, G/2, B/2);
 fill(255);
 rect(displayWidth/1.8,displayHeight/2,displayWidth/17,displayHeight/2);
 rect(displayWidth-displayWidth/1.8,displayHeight/2,displayWidth/17,displayHeight/2);}
}
void dessiner()
{
 //smooth(8);
 fill(255);
 noStroke();
 rectMode(CENTER);
 rect(displayWidth-displayWidth/26,yBOT,displayWidth/50,displayHeight/6.6);
 // text(score, displayWidth-displayWidth/40, displayHeight-displayHeight/16);
  textSize(30);
  if (deplacementY >= 0 && deplacementX >= 0) {scoreM = 0;}
  else if (deplacementY < 0 && deplacementX > 0) { scoreM = 1;}
  else  if (deplacementY > 0 && deplacementX < 0) { scoreM = 2;}
  else if (deplacementY <= 0 && deplacementX <= 0) { scoreM = 3;}
  if (scoreM == 0) {text(score, x-displayWidth/80, y-displayHeight/20);}
  else if (scoreM == 1) { 
       // if(zero < displayWidth
  text(score, x-displayWidth/80, y+displayHeight/20);}
  else if (scoreM == 2) { text(score, x+displayWidth/80, y-displayHeight/20);}
  else if (scoreM == 3) { text(score, x+displayWidth/80, y+displayHeight/20);}
//text(score, displayWidth-displayWidth/2.2, displayHeight/12);
  text("" + score + " rebond" + (score>1 ? "s " : "" ), width/2, displayHeight-displayHeight/16);
 

 if (BalleStatu == 2 || BalleStatu == 1) { if(RS==false){VV += 10; BB += 10;} fill(RR,VV,BB); RS = false;}
 ellipse(x,y,displayHeight/20,displayHeight/20);
 rect(w,z,displayWidth/50,displayHeight/6.6);


      

    
}
void ralentir()
{
  a = random(displayWidth/2000,displayWidth/1000);
  deplacementY -= a;
  
}
void bouger()
{

  if (BalleStatu == 2) {deplacementY = height/-133 - Yfourbe - Y*2; deplacementX += Yfourbe/2; Yfourbe++; /*displayHeight/1200;*/}
  else if (BalleStatu == 1) {deplacementY =  -height/-133 + Yfourbe + Y*2; deplacementX += Yfourbe/2; Yfourbe ++;/* displayHeight/1200;*/}
  else { Yfourbe = displayHeight/1000; }// deplacementX = width/66; deplacementY = height/-133;
  
    if (x > w+displayWidth/100 && x < width/26+width/100+displayHeight/20 + deplacementX && deplacementX<0 && y<z+displayHeight/12+displayHeight/40 && y>z-displayHeight/12-displayHeight/40) //rectification balle a gauche
    {x = width/26+width/100+displayHeight/40;} 
    else {x += deplacementX;}
  y += deplacementY;

  if (x >= displayWidth-displayWidth/26-displayWidth/100-displayHeight/40) //rectification balle a droite
  { x = displayWidth-displayWidth/26-displayWidth/100-displayHeight/30;}


 
   
  if (mouseY<displayHeight-displayHeight/13.2 && mouseY>displayHeight/13.2) { z = (mouseY);}
  else if (mouseY>displayHeight-displayHeight/13.2) {z = displayHeight-displayHeight/13.2;}
  else if (mouseY<displayHeight/13.2) {z=displayHeight/13.2;}
  
   
  if (y<displayHeight-displayHeight/13.2 && y>displayHeight/13.2) {  yBOT = y;}
  else if (y>displayHeight-displayHeight/13.2) { yBOT = displayHeight-displayHeight/13.2;}
  else if (y<displayHeight/13.2) { yBOT=displayHeight/13.2;}

}
void rebondir()
{
  if (x >= displayWidth-displayWidth/26-displayWidth/100-displayHeight/30 && deplacementX >0 &&  y<yBOT+displayHeight/12  && y>yBOT-displayHeight/12) //trop a droite
  {RR = 255; BB = 10; VV = 10; deplacementX = -width/66; /*deplacementY = height/-133;*/ BalleStatu = 0;}
   //if ((x >= displayWidth-displayWidth/26-displayWidth/100-displayHeight/30 && x <= displayWidth-displayWidth/26+displayWidth/100+displayHeight/30) && (y >= z-displayHeight/12 || y <= z+displayHeight/12 )) // bot rebond lateral
  //{deplacementY = -deplacementY; BalleStatu = 0;}
  if (x >= width/26-width/100 && x <= width/26+width/100) //rebond lateral
  { if (y <= z+displayHeight/9+displayHeight/40 && y >= z-displayHeight/9-displayHeight/40) { deplacementY = -deplacementY; BalleStatu = 0;}}
 
  
  if (y > height-displayHeight/30 && deplacementY<displayHeight/10)//trop bas
  {deplacementY = -deplacementY; BalleStatu = 0; ralentir();}
  if (y < displayHeight/40 && deplacementY <0)//trop haut
  {deplacementY = abs(deplacementY); BalleStatu = 0; ralentir();}
  if (x < w-displayWidth/30 || x == displayWidth/90)//perdu
  { scorePrint = true;}
  if (x == width/26+width/100+displayHeight/40/* && x >= width/30+displayHeight/40*/&& y<z+displayHeight/12+displayHeight/40  && y>z-displayHeight/12-displayHeight/40) //joueur a la balle
  {
   if (y < z - displayHeight/48) { BalleStatu = 1;}
   if (y > z + displayHeight/48) { BalleStatu = 2;}

  deplacementX = abs(deplacementX); score++;}
}
