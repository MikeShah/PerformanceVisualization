
Draggable d1;
Draggable d2;
Draggable d3;
Draggable d4;
Draggable d5;
Draggable d6;

void setup(){
   size(640,480,P3D);
   
   d1 = new Draggable(0,0);
   d2 = new Draggable(0,120);
   d3 = new Draggable(0,240);
   d4 = new Draggable(300,0);
   d5 = new Draggable(300,120);
   d6 = new Draggable(300,240);
   
   d2.setRenderable(new Histogram());
   d3.setRenderable(new TreeMap());
   d4.setRenderable(new ParticleSystem());
   d5.setRenderable(new CodeCity());
   d6.setRenderable(new ChordDiagram());
}


void draw(){
  background(0);
  
  d1.render();
  d2.render();
  d3.render();
  d4.render();
  d5.render();
  d6.render();
}