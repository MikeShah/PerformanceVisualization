
/*
    Purpose: Create a draggable canvas where information is rendered.
*/
class Draggable{
  
  float r,g,b;     // Non-Dragable color
  float rd,gd,bd;  // Draggable color
  float x,y,w,h;   // Position and dimensions
  float canvasHeight;  // Height of the renderable area
  float canvas_r,canvas_g,canvas_b; // color of the renderable area
  int state;  // 0 means stable, 1 means being hovered, 2 means being dragged, 3 means being re-sized
  
  Draggable drawTo;  // Which draggable to draw to? This tells us, which visualization to draw edges to.
                     // We will subsequently need to get a reference to that visualizations DataLayer.
                     
  // The visualization that is rendered
  public Renderable myRenderable;
  // The data associated with the Draggable widget
  public DataLayer myDataLayer;
  
  // Size of the target for resizing the visualization
  float resizeSquare = 10;
  
  
   // Figures out the top left corner of the canvas
  // This is equivalent to 0,0 in the global screenspace
  float relative_offsetX = x;
  float relative_offsetY = y+h;
  
  void init(){
    // Initialize the data layer.
    myDataLayer = new DataLayer();
    
    // Set the renderable right away. Note it is important to do this first and then update things later.
    // TODO make this something else so we can have multiple visualizations...maybe a list?
    setRenderable(new GridVisualization());
    // Draggable titlebar part
    state = 0;
    r=179;
    g=171;
    b=154;
    rd=gd=bd=255;
    x=y=0;
    w=300;
    h=20;
    // Canvas properties
    canvas_r=255;
    canvas_g=244;
    canvas_b=219;
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
  
  private void resizeWidget(){
      // Only resize if we're in bounds
    if(mouseX > x+w-resizeSquare && mouseX < x+w && mouseY < y+canvasHeight+h+resizeSquare && mouseY > y+canvasHeight+resizeSquare){
      println("resizing");
      fill(255,0,0);
      if(mousePressed==true){
        w+= mouseX - pmouseX;
        canvasHeight+= mouseY - pmouseY;
        resized();
      }
    }
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
     /* Gradient
     beginShape();
     fill(r,g,b);
     vertex(x,y);
     vertex(x,y+h);
     fill(g,r,b);
     vertex(x+w,y+h);
     vertex(x+w,y);
     endShape();
     */
     
     ellipse(x+7.5,y+9,10,10);
     
     // Canvas
     fill(canvas_r,canvas_g,canvas_b,128);
     rect(x,y+h,w,canvasHeight);
     
     // Resize square
     fill(r,g,b);
    // Perform resizing
    resizeWidget();
     rect(x+w-resizeSquare,y+canvasHeight+resizeSquare,resizeSquare,resizeSquare);
     
     
     // (1) Figure out our offsets
     myRenderable.getOffsets(relative_offsetX, relative_offsetY);
     // (3) Render final results
     myRenderable.render();
     
     // Titlebar text
      fill(0);stroke(0);
      text("Some state:"+state,x+20,y+10);
      
      // Draw a line between linked components
      if(drawTo != null){
         fill(255); stroke(255);
         rect(x,y,5,5);
         line(x,y,drawTo.x,drawTo.y);
         ellipse(drawTo.x,drawTo.y,5,5);
      }
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
  
  private void setDrawTo(Draggable d){
   drawTo = d;
  }
  
  // Drag the object from the titlebar
  private void drag(){
    checkBounds();
    if(state==2){
      if(mousePressed==true){
        state = 0;
      }
      
      
      // Only drag our object if we're within bounds
      if( mouseX < x+w && mouseX > x){
        x+= mouseX - pmouseX;
      }
      if( mouseY < y+h && mouseY > y){
        y+= mouseY - pmouseY;
      }
    }
    
  }
  
  
}