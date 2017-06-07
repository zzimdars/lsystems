

class ImageParticle extends Particle {
  
  PImage img;
  float rot;
  color startCol;
  color endCol;
  
  ImageParticle(PVector o, PImage i) {
    super(o);
    startCol = color(255, 255);
    endCol = color(255, 0);
    vel = new PVector(randomGaussian()*0.3, 
                      randomGaussian()*0.3);
    img = i;
    rot = randomGaussian()*PI/8;
  }
  
  ImageParticle(PImage i) {
    this(new PVector(0,0), i);
  }
  
  ImageParticle(PImage i, color stC, color endC) {
    this(i);
    startCol = stC;
    endCol = endC;
  }
  
  void display() {
    tint(lerpColor(endCol, startCol, lifespan/255));
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(rot);
    imageMode(CENTER);
    image(img, 0,0);
    popMatrix();
  }
  
}