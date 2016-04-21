import controlP5.*;

DetailsPane dp;


Draggable d1;
Draggable d2;
Draggable d3;
Draggable d4;
Draggable d5;
Draggable d6;

void settings(){
   size(640,480,P3D);
}

void setup(){
   
   dp = new DetailsPane();
   
   d1 = new Draggable(10,0);
   d2 = new Draggable(10,130);
   d3 = new Draggable(10,260);
   d4 = new Draggable(320,0);
   d5 = new Draggable(320,130);
   d6 = new Draggable(320,260);
   
   d2.setRenderable(new Histogram());
   d3.setRenderable(new TreeMap());
   d4.setRenderable(new ParticleSystem());
   d5.setRenderable(new CodeCity());
   d6.setRenderable(new ChordDiagram());
   
   d1.setDrawTo(d2);
}


void draw(){
  background(0,0,0);
  
  d1.render();
  d2.render();
  d3.render();
  d4.render();
  d5.render();
  d6.render();
}