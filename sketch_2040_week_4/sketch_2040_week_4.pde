PVector[] sp;
PVector[] acc;
int num = 25;


void setup() {
  size(800, 800);
  sp = new PVector[num];
  acc = new PVector[num];
  for (int i = 0; i < num; i++) {
    sp[i] = new PVector(random(width), random(height), random(5, 70));
    acc[i] = new PVector(random(-2, 2), random(-2, 5), 0);
  }
  stroke(255);
  noFill();
  background(0,100);
}


int numcircs = 0;

void draw() {
  numcircs = 0;

  //background(0);
  for (int j = 0; j < num; j++) {
    sp[j].add(acc[j]);

    if ((sp[j].x > width) || (sp[j].x < 0)) {
      acc[j].x = acc[j].x * -1;
    }

    if ((sp[j].y > height) || (sp[j].y < 0)) {
      acc[j].y = acc[j].y * -1;
    }

    for (int i = 0; i < num; i++) {
      float d = PVector.dist(sp[j], sp[i]);
      if (d <= 150  ) {
 //repells from each other 
        acc[i].x = acc[i].x * -1.0000000000000000001;
 
 
        stroke(255);

        strokeWeight(0.5);
        line(sp[i].x, sp[i].y, sp[j].x, sp[j].y);
     if (d <= 10) {
     //covers some of the background so it can keep drawing with out it being to mutch of a mess           
        strokeWeight(1.5);
       stroke(10);
                noFill();
          rect(sp[i].x, sp[i].y, sp[j].x, sp[j].y);
    }
       
      }
      strokeWeight(0.5);

      fill(30,100,80);
      ellipse(sp[i].x, sp[i].y, sp[i].z, sp[i].z);
     
  
      numcircs++;
    }

  
  }
  
  println(frameRate);
}
// press to reset background
void mousePressed(){
  background(0);
  
}
