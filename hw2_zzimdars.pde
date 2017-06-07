String memes = "CSUL";
String teams = "FFF[-FFFF[-FFF[-FF[-L]+L]+FF[-L]+L]+FFF[-FF[-L]+L]+FF[-L]+L]+FFFF[-FFF[-FF[-L]+L]+FF[-L]+L]+FFF[-FF[-L]+L]+FF[-L]+L";
String dreams = "BFRFFBFR";
//boolean first = true;
//ArrayList<ParticleSystem> systems = new ArrayList<ParticleSystem>();
ArrayList<PVector> origins = new ArrayList<PVector>();
PVector force = new PVector(0,0);
float y = 0;
boolean rain = false;
int counter = 0;
Drop[] drops = new Drop[500];
PVector[] trees = new PVector[7];


void setup() {
  size(800,800);
  background(0);
  
  for(int i = 0; i < drops.length; i++) {
    drops[i] = new Drop();
  }
  
  for(int i = 0; i < trees.length; i++) {
    trees[i] = new PVector(random(0,width),random(450,800));
  }
}

float tmpx = 0;
float tmpy = 0;
void draw() {
  background(135,206,235);
  noStroke();
  fill(0,104,10);
  ellipse(400,900,1800,1200);
  stroke(0);
  fill(0);
  textSize(20);
  text("Press the UP arrow to lower clouds", 450, 750);
  text("Click anywhere to spawn wind", 490, 775);
  
  stroke(83,49,24);
  strokeWeight(3);
  
  doMemes();
  for(int i = 0; i < trees.length; i++) {
    doTeams(trees[i].x, trees[i].y);  
  };
        //if(systems.size() > 0) {
        //  for(int j = 0; j < systems.size(); j++) {
        //    ParticleSystem p = systems.get(j);
        //    p.applyForce(new PVector(0,-0.1));
        //    p.run();
        //    if(p.locked <= 0) {
        //      p.addParticle();
        //    } else {
        //      p.locked++;
        //    }
        //  }
        //}
  doDreams();
  pushMatrix();
  resetMatrix();
  if(rain == true) {
    for(int i = 0; i < drops.length; i++) {
      drops[i].fall();
      drops[i].display();
    }
  }
  popMatrix();
}

void mouseReleased() {
  origins.add(new PVector(mouseX, mouseY));
}

void doMemes() {
  pushMatrix();
  translate(0,0);
  for(int i = 0; i < memes.length(); i++) {
    char c = memes.charAt(i);
    if(c == 'U') { 
      y += 15;
      translate(0,15);
    }
    else if(c == 'C') drawCirc(20);
    else if(c == 'S') rain = true;
  }
  popMatrix();
}

void createRain() {
  pushMatrix();
  resetMatrix();
  //ParticleSystem ps1 = new ParticleSystem(new PVector(100, y));
  //ParticleSystem ps2 = new ParticleSystem(new PVector(400, y));
  ////ParticleSystem ps3 = new ParticleSystem(new PVector(700, y));
  //systems.add(ps1);
  //systems.add(ps2);
  ////systems.add(ps3);
  
  popMatrix();
}

void drawCirc(float size) {
  //println("drawing circ");
  fill(128);
  stroke(128);
  for(int i = 0; i < width+20; i += 20) {
    float s = random(size-5, size+15);
    ellipse(i,0, s,s);
  }
}

//void addBlades(float len) {
//  for(int i = 0; i < width; i += 5) {
//    blades.add(new Blade(new PVector(i,0),len));
//  }
//}

//void drawBlades() {
//  stroke(0,104,10);
//  for(int i = 0; i < blades.size(); i++) {
//    Blade b = blades.get(i);
//    translate(b.origin.x, b.origin.y);
//    rotate(b.angle);
//    if(b.angle >= PI/10) {
      
//    }
//    b.display();
//  }
//}

void doTeams(float x, float y) {
  //println(teams.length());
  stroke(83,49,24);
  //translate(,0);
  pushMatrix();
  resetMatrix();
  translate(x,y);
  for(int i = 0; i < teams.length(); i++) {
    char c = teams.charAt(i);
    if(c == 'F') f(20);
    else if(c == 'L') {
      f(20);
      dropLeaves(20);
    }
    else if(c == '-') turnLeft(PI/6);
    else if(c == '+') turnRight(PI/6);
    else if(c == '[') {
      pushMatrix();
      //println("c = " + c + " in [ if at " + i + "/" + teams.length());
    }
    else if(c == ']') {
      popMatrix();
      //println("popped matrix at " + i + "/" + teams.length());
    }
  }
  popMatrix();
  //first = false;
}

void dropLeaves(float len) {
  //Particle p = new Particle(new PVector(0,-len));
  //ParticleSystem ps = new ParticleSystem(new PVector(0, -len));
  //systems.add(ps);
}

void doDreams() {
  //for(int i = 0; i < systems.size(); i++) {
  //  systems.get(i).applyForce(force.mult(float(origins.size())));
  //}
  noFill();
  stroke(255);
  for(int i = 0; i < origins.size(); i++) {
    float x = origins.get(i).x;
    float y = origins.get(i).y;
    pushMatrix();
    resetMatrix();
    //bezier(x,y, x-64,y+23,x-253,y+20,x-245,y-39);
    bezier(x,y, x-19,y+11, x-80,y-4, x-45,y-21);
    popMatrix();
    pushMatrix();
    resetMatrix();
    translate(origins.get(i).x-20,origins.get(i).y+25);
    x = 0;
    y = 0;
    bezier(x,y, x-18,y-9, x-80,y-4, x-44, y+20);
    popMatrix();
    pushMatrix();
    resetMatrix();
    translate(origins.get(i).x-60, origins.get(i).y);
    x = 0;
    y = 0;
    bezier(x,y, x-19,y+11, x-80,y-4, x-45,y-21);
    popMatrix();
    pushMatrix();
    resetMatrix();
    translate(origins.get(i).x-80, origins.get(i).y+25);
    bezier(x,y, x-18,y-9, x-80,y-4, x-44, y+20);
    popMatrix();
  }
  //bezier(55,261,47,320,236,323,300,300);
}

void upgradeMemes() {
  String tmp = "";
  for(int i = 0; i < memes.length(); i++) {
    char c = memes.charAt(i);
    if(c == 'U') {
      tmp += "CU";
    } 
  }
  memes += tmp;
}

//void upgradeTeams() {
//  String tmp = "";
//  for(int i = 0; i < teams.length(); i++) {
//    String katara = "";
//    char c = teams.charAt(i);
//    if(c == 'F') {
//      katara += "FF";
//    } else if(c == 'X') {
//      katara += "F[-L]+L";
//    }
//  }
//}

void f(float len) {
  line(0,0, 0,-len);
  translate(0,-len);
}

void turnLeft(float angle) {
  rotate(-angle);
}

void turnRight(float angle) {
  rotate(angle);
}

void keyPressed() {
  if(keyCode == RIGHT || keyCode == UP) {
    if(counter <= 2) {
      upgradeMemes();
    }
    counter++;
  }
}