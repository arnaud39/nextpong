package processing.test.pongb2nonmodulaire;

import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import ddf.minim.spi.*; 
import ddf.minim.signals.*; 
import ddf.minim.*; 
import ddf.minim.analysis.*; 
import ddf.minim.ugens.*; 
import ddf.minim.effects.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class pongB2NONMODULAIRE extends PApplet {







AudioPlayer song;
 Minim minim;
 Minim gameover;
 

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



public void renV ()
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

                             //vitesse de d\u00e9placement verticale de la balle
  w = width/26; z = height/2;                               //taille de la raquette
  x2 = width/2; y2 = height/2;                              //variables BOTS
  deplacementX2 = width/66;
  deplacementY2 = height/-133;
  w2 = width/26; z2 = height/3;
  w3 =  width-width/18; z3 = height-height/3;
  //firstStart = false;

  check = false;

}
public void setup()
{ // Open the file from the createWriter()
  music = false;
  reader = createReader("highscore.txt");  
  importHighscore();  
  minim = new Minim(this);
  gameover = new Minim(this);
  BalleStatu = 0;
  Balle = false;
  compteur = 0;
  Yfourbe = 0;
  R = 243;//8;
  G = 156;//58;
  B = 18;//78;
  orientation(LANDSCAPE); //definiton de la r\u00e9solution du jeu
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
  }                              //vitesse de d\u00e9placement verticale de la balle
  w = width/26; z = height/2;                               //taille de la raquette

  x2 = width/2; y2 = height/2;                              //variables BOTS
  deplacementX2 = width/66;
  deplacementY2 = height/-133;
  w2 = width/26; z2 = height/3;
  w3 =  width-width/18; z3 = height-height/3;

 firstStart = false;
 check = false;


}

public void draw()
{
  //sauvegarde
  /* if (key == ESC || key == ESC) {
      output.flush(); // Writes the remaining data to the file
      output.close(); // Finishes the file
      exit();
    }*/
  //
if (jeu == false) //ecran d'accueil au premier lancement et apr\u00e8s un game over
 {
   
   accueil();   

 }

else if (jeu == true)//jeu, fonction qui tourne en boucle
 {
   if (accson == true && music == true){
    minim.stop();
     song = minim.loadFile("jeu.mp3");
    song.loop();
    accson = false;
  }  
 jeu = true;
 scoreM = 0;
  if (mousePressed) {frameRate(60);} else {frameRate(5);}
  if (firstStart == true) {firstStart = false; x = width/2; y=height/2;  //petit temps avant l'activation du d\u00e9placement de la balle et mise en place de celle-ci au milieu de l'ecran
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
      song = minim.loadFile("gameover.wav");
      song.play();
      if (scorePrinted == true){
        jeu = false;
        score = 0;
        delay(1000);
       
        renV();}
      scorePrinted = true; }}}

public void background()
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
public void nettoyer() {

if (mousePressed) {background(R, G, B);} 
else {
background(R/2, G/2, B/2);
 fill(255);
 rect(displayWidth/1.8f,displayHeight/2,displayWidth/17,displayHeight/2);
 rect(displayWidth-displayWidth/1.8f,displayHeight/2,displayWidth/17,displayHeight/2);}
}
public void dessiner()
{
 //smooth(8);
 fill(255);
 noStroke();
 rectMode(CENTER);
 rect(displayWidth-displayWidth/26,yBOT,displayWidth/50,displayHeight/6.6f);
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
 rect(w,z,displayWidth/50,displayHeight/6.6f);


      

    
}
public void ralentir()
{
  a = random(displayWidth/2000,displayWidth/1000);
  deplacementY -= a;
  
}
public void bouger()
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


 
   
  if (mouseY<displayHeight-displayHeight/13.2f && mouseY>displayHeight/13.2f) { z = (mouseY);}
  else if (mouseY>displayHeight-displayHeight/13.2f) {z = displayHeight-displayHeight/13.2f;}
  else if (mouseY<displayHeight/13.2f) {z=displayHeight/13.2f;}
  
   
  if (y<displayHeight-displayHeight/13.2f && y>displayHeight/13.2f) {  yBOT = y;}
  else if (y>displayHeight-displayHeight/13.2f) { yBOT = displayHeight-displayHeight/13.2f;}
  else if (y<displayHeight/13.2f) { yBOT=displayHeight/13.2f;}

}
public void rebondir()
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
float x2, y2, w2, z2, w3, z3, deplacementX2, deplacementY2;
int R, G, B;

public void accueil()
{

  if (music == false && accson == false)
 { 
    song = minim.loadFile("accueil.mp3");
    song.loop();
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
  text("NEXT PONG", displayWidth/2, displayHeight/4.9f);
  
   textFont(font, 100);
  text("TAP TO START...", displayWidth-displayWidth/2.4f, displayHeight/1.37f);
  text("BEST SCORE: " + highscore, displayWidth/5, displayHeight/1.1f);

  nettoyerAccueil();
 bouger2();
 BOTrebondir();
 //deplacementFourbe();
 dessiner2(); 
  
  
   if(mousePressed){ jeu = true;}
}


public void nettoyerAccueil() {
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
  text("NEXT PONG", displayWidth/2, displayHeight/4.9f);
  //image(play,displayWidth/2.8,displayHeight/1.5,displayHeight/15,displayHeight/15); 
   textFont(font, 100);
  text("TAP TO START...", displayWidth-displayWidth/5, displayHeight/1.1f);
  text("BEST SCORE: " + highscore, displayWidth/5, displayHeight/1.1f);
}
public void dessiner2()
{
   
 noStroke();
 smooth(8);
 fill(255);
 rectMode(CENTER);
 rect(w2,z2,displayWidth/50,displayHeight/6.6f);
 rect(w3,z3,displayWidth/50,displayHeight/6.6f);
 fill(255);
 ellipse(x2,y2,displayHeight/30,displayHeight/30);
 

    
}
public void bouger2()
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
public void BOTrebondir()
{
  if (x2 > width-width/40 && deplacementX2 >0) //trop a droite
  {deplacementX2 = -deplacementX2;}
  if (y2 > height-displayHeight/4 && deplacementY2<displayHeight/10)//trop bas
  {deplacementY2 = -deplacementY2;}
  if (y2 < displayHeight/4 && deplacementY2 <displayHeight/40)//trop haut
  {deplacementY2 = abs(deplacementY2);}
  if (x2<w2+displayWidth/20 && y2<z2+displayHeight/12  && y2>z2-displayHeight/12)
  {deplacementX2 = abs(deplacementX); deplacementX2 += 25; deplacementY2 -= 15;}
  if (x2>w3-displayWidth/36.5f/* && y2<z3 && y2<z3+displayHeight/12*/)
  {deplacementX2 = -deplacementX2; deplacementX2 -= 100;}
}
int highscore;
PrintWriter output;
BufferedReader reader;
String line;



public void importHighscore() {
  // Open the file from the createWriter()
  reader = createReader(highscoreFile);
  if (reader == null) {
    highscore = 0;
    return;
  }
  String line;
  try {
    line = reader.readLine();
  } catch (IOException e) {
    e.printStackTrace();
    line = null;
  }
  if (line != null) {
    highscore = PApplet.parseInt(line);
    println(highscore);
  }
  try {
    reader.close();
  } catch (IOException e) {
    e.printStackTrace();
  }
}

public void updateHighscore() {
  if (highscore < score) {
    highscore = score;
    output = createWriter(highscoreFile);
    output.println(highscore);
    output.close(); 
  }
}

  public int sketchWidth() { return displayWidth; }
  public int sketchHeight() { return displayHeight; }
}
