import ddf.minim.effects.*;
import ddf.minim.analysis.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.*;
import ddf.minim.ugens.*;

/*Accueil*/




/**/



Minim minim;
AudioPlayer son;
boolean musique = false;

int R, G, B, compteur; //background
boolean couleur = true;
ArrayList particles = new ArrayList();
PFont lemon;
PFont Riverdrive;
int temps;
int j;
color j2;

void setup() {
  j2 = 255;
  size(displayWidth,displayHeight);
  R = 243;//8;
  G = 156;//58;
  B = 18;//78;
  setupParticles();

  lemon =  loadFont("HangingLetters-70.vlw");
  Riverdrive = loadFont("DimitriSwank-72.vlw");
   minim = new Minim(this);
   son = minim.loadFile("2_musicIntro.mp3");
   son.play();
   
}

void draw() {
  temps = millis();
  nettoyer();
  if (temps > 7000) {background();
    if (musique == false){ musique = true; son = minim.loadFile("1_musicMenu.mp3"); son.play();
  }
    accueil();}

  else  {backgroundLogo();  particles();}
 

}

void nettoyer() {

 
  
/*if (mousePressed) {background(R, G, B);//} 
/*else {
background(R/2, G/2, B/2);
 fill(255);
 rect(displayWidth/1.8,displayHeight/2,displayWidth/17,displayHeight/2);
 rect(displayWidth-displayWidth/1.8,displayHeight/2,displayWidth/17,displayHeight/2);}
*/}

void background()
{

if ( R == 243 && G == 156 && B == 18) { compteur++; if (compteur == 1200) {compteur = 0; couleur = true;}} //couleur de fond qui varie
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
 
 background(R, G, B);
 }
 
void backgroundLogo()
{
  background(0);



} 