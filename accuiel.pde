void backgroundAccueil()
{

int diam = 50; // trt diam = 600 
noStroke(); 
background(175); 
// x,y rects 
for (int x =0; x<= width; x=x+diam-1) { 
  for (int y = 0; y<= height; y=y+diam) { 
  fill(random(255), random(255), random(255),100); 
    rect(x,y, diam, diam); 
  }} 
for (int x =0; x<= width; x=x+5) { 
  for (int y = 0; y<= height; y=y+5) { 
  strokeWeight(0.5); 
  stroke(0,0,0,35); 
  line(x,y,x+5,y+5); 
  } } 
}
void accueil()

{
   
 backgroundAccueil();
 // background(255);
  fill(0, 0, 0);
  stroke(255, 255, 255);
  textFont(Riverdrive, 170);
  textAlign(CENTER);
  text("Next Pong", displayWidth/2, displayHeight/4.9);
  text("Tap to start...", displayWidth-displayWidth/3.2, displayHeight/1.1);
 
}

void particles ()
{
 
 if (temps > 5500){
   j2 -= 4;
   if (j2 < 0) {j2 = 0;}
 }
 fill(j2);
 stroke(j2);
 
 if (j < height/2) { j += displayHeight/50 + j/5; }
 translate(width/2, j);
  for (int i = 0; i < particles.size (); i++) {
    Particle p = (Particle) particles.get(i);
    p.draw();
    for (int q = 0; q < particles.size (); q++) {
      Particle p2 = (Particle) particles.get(q);
      if (PVector.dist(p.loc, p2.loc) < p.r/1.45) {
        strokeWeight(1+abs(sin(radians(p.r*3))*3));
        line(p.loc.x, p.loc.y, p2.loc.x, p2.loc.y);
      }
    }
  }
  textSize(70);
  textFont(lemon);
  textAlign(CENTER);
  text("LemonTech", 0, displayHeight/3); 
}
void setupParticles()
{
  
  noFill();
  stroke(255, 125);
  for (int q = 1; q < 8; q++) {
    float r = q * 30;
    for (int i = 0; i < 360; i++) {
      if ((i%60)==0) {
        particles.add(new Particle(i, r));
      }
    }
  }
 

}