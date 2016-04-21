
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

/*
    Purpose: Create a draggable canvas where information is rendered.
*/
class Draggable{
  
  float r,g,b;     // Non-Dragable color
  float rd,gd,bd;  // Draggable color
  float x,y,w,h;   // Position and dimensions
  float canvasHeight;  // Height of the renderable area
  float canvas_r,canvas_g,canvas_b; // color of the renderable area
  int state;  // 0 means stable, 1 means being hovered, 2 means being dragged
  
  Draggable drawTo;  // Which draggable to draw to? This tells us, which visualization to draw edges to.
                     // We will subsequently need to get a reference to that visualizations DataLayer.
                     
  // The visualization that is rendered
  public Renderable myRenderable;
  // The data associated with the Draggable widget
  public DataLayer myDataLayer;
  
  
   // Figures out the top left corner of the canvas
  // This is equivalent to 0,0 in the global screenspace
  float relative_offsetX = x;
  float relative_offsetY = y+h;
  
  void init(){
    // Set the renderable right away. Note it is important to do this first and then update things later.
    // TODO make this something else so we can have multiple visualizations...maybe a list?
    setRenderable(new GridVisualization());
    // Draggable titlebar part
    state = 0;
    r=g=b=192;
    rd=gd=bd=255;
    x=y=0;
    w=300;
    h=20;
    // Canvas properties
    canvas_r=canvas_g=canvas_b=128;
    canvasHeight = 100;
    
    drawTo = null;
    
    resized();
  }
  
  // Called whenever we resize the widget
  void resized(){
    myRenderable.w = w;
    myRenderable.h = canvasHeight;  // Note this is the height of the drawing area 'h' is the height of the titlebar.
  }
  
  public Draggable(float x, float y){
    init();
    this.x = x;
    this.y = y;
  }
  
  // Sets the renderable object to a new type of visualization
  public void setRenderable(Renderable r){
      myRenderable = r;
      resized();
  }
  
  // Render the widget
  public void render(){    
    // Perform the drag functionality 
    drag();
    // Compute canvas coordinates
    relative_offsetX = x;
    relative_offsetY = y+h;
     
     // Titlebar
      if(state==0){
        fill(r,g,b,192);
      }else{
        fill(rd,gd,bd,192);
      }
     
     stroke(r,g,b);
      
     rect(x,y,w,h);
     // Canvas
     fill(canvas_r,canvas_g,canvas_b,128);
     rect(x,y+h,w,canvasHeight);
     
     myRenderable.getOffsets(relative_offsetX, relative_offsetY);
     myRenderable.render();
     
     // Titlebar text
      fill(0);stroke(0);
      text("Some state:"+state,x+1,y+10);
  }
  
  // Check to make sure the 
  private void checkBounds(){
    if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h){
        state = 1;
      if(mousePressed==true && state!=2){
        state = 2;
      }
    }else{
      state = 0;
    }
  }
  
  // Drag the object from the titlebar
  private void drag(){
    checkBounds();
    if(state==2){
      if(mousePressed==true){
        state = 0;
      }
      
      // Only drag our object if we're within bounds
      if( mouseX < width && mouseX > 0){
        x+= mouseX - pmouseX;
      }
      if( mouseY < height && mouseY > 0){
        y+= mouseY - pmouseY;
      }
      
    }
    
  }
  
}