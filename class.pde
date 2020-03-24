 class balle
{
  int m_taille = displayHeight/20;
  int m_posX = displayWidth/2;
  int m_posY = displayHeight/2;
  int m_deplacementX;
  int m_deplacementY;
  int m_balleStatu;
  
  void bouger()
  {
  
  
  }
  
  void rebondir()
  {
   /* if (x >= displayWidth-displayWidth/26-displayWidth/100-displayHeight/30 && deplacementX >0 &&  y<yBOT+displayHeight/12  && y>yBOT-displayHeight/12) //trop a droite
  {m_deplacementX = -width/66; BalleStatu = 0;}
   
  if (x >= width/26-width/100 && x <= width/26+width/100) //rebond lateral
  { if (y <= z+displayHeight/9+displayHeight/40 && y >= z-displayHeight/9-displayHeight/40) { deplacementY = -deplacementY; BalleStatu = 0;}}
 
  
  if (y > height-displayHeight/30 && deplacementY<displayHeight/10)//trop bas
  {deplacementY = -deplacementY; BalleStatu = 0; ralentir();}
  if (y < displayHeight/40 && deplacementY <0)//trop haut
  {deplacementY = abs(deplacementY); BalleStatu = 0; ralentir();}
    */
  }
  
  
};
class raquette
{ 
  protected
  int m_y = displayHeight/2;
  float m_tailleX = displayWidth/50;
  float m_tailleY = displayHeight/6.6;
  public
  void joueurDeplacer (int posX, int posY)
  {
   m_y = posY;
  }
  void afficher (int m_tailleX, int m_tailleY, int m_x, int m_y)
  {
     rect(m_x,m_y,m_tailleX,m_tailleY);
  }
  
 
};

class ordinateur extends raquette
{
  private
  int m_x = displayWidth-displayWidth/26;
  boolean m_vivant = true;
  public
  boolean estVivant(int balleX, int tailleBalle)
   {
      if (m_x < balleX + tailleBalle/2) { m_vivant = false;}
      return m_vivant;
   }
  boolean aLaBalle(int balleX, int balleY, int deplacementX, int deplacementY)
   {  
   if (balleX >= m_x-displayWidth/100-displayHeight/30 && deplacementX >0 &&  balleY<m_y+displayHeight/12  && balleY>m_y-displayHeight/12) //trop a droite
   {      return true;}
   //m_deplacementX = -width/66; BalleStatu = 0;}
   else { return false;}
   }
};

class joueur extends raquette
{
  private
  int m_x = width/26;
  boolean m_vivant = true;
  public
  boolean estVivant(int balleX, int tailleBalle)
    {
      if (m_x < balleX + tailleBalle/2) { m_vivant = false;}
      return m_vivant;
    }
  
};

class Particle {
  PVector loc, vel;
   
  float i, r;
 
  Particle(float i, float r) {
    this.i = i;
    this.r = r;
    loc = new PVector(sin(radians(i+r*3))*r, cos(radians(i+r*3))*r);
    vel = new PVector();
  }
 
  void draw() {
    if((r%12)==0){
      float angle = -30+sin(radians(r+frameCount*3))*15;
      loc = new PVector(sin(radians(i+r*3+angle))*r, cos(radians(i+r*3+angle))*r);
    }
    ellipse(loc.x, loc.y, 5, 5);
  }
}

