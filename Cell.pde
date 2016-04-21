/*

    Purpose: Store the data of a single function


*/

class Cell{
    
    // 3D Location
    float x;
    float y;
    float z;
    // Size
    float w; // x-axis
    float h; // y-axis
    float d; // z-axis
        
    // Color
    float r,g,b;
    // Actual data
    nodeMetaData metaData;
    // Time Cell is on the curve
    float time;
    
    // Selected (if we have clicked)
    boolean selected = false;
    // Highlighted (if we merely mouse'ing over and have not clicked )
    boolean highlighted = false;
    
    // Call tree node
    int myCallTreeIndex = -1;  // The index of the cell in the linearized call tree.
    
    // Default Constructor for the cell
    // Each cell should have a name by default.
    public Cell(String name){
        metaData = new nodeMetaData();
        this.metaData.name = name;
    }
    
    // Set the color of the cell
    public void setRGB(float r, float g, float b){
      this.r = r;
      this.g = g;
      this.b = b;
    }
    
    public color getRGB(){
      return color(r,g,b);
    }
    
    public void setXYZ(float x, float y, float z){
      this.x = x;
      this.y = y;
      this.z = z;
    }
    
    // Set the width height and depth
    public void setWHD(float w, float h, float d){
      this.w = w;
      this.h = h;
      this.d = d;
    }
    
    // Adds a child in the nodeMetaData
    public void addChildCell(Cell child){
      metaData.addChild(child);      
    }

    // Draw a code city
    public void render3D(){
      onHover();
      
      pushMatrix();
         translate(x,y,z);
         rotateX(45);
         box(w, h, d);
       popMatrix();
    }
    
    // Draw a code city
    public void render(){
      onHover(); 
      rect(x, y, w,h);
    }
    
    private void onHover(){
      if(mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h){
        fill(g,r,b);
        highlighted = true;
        dp.dataString.setText(metaData.name);
      }else{
        fill(r,g,b);
      }
    }
    
}