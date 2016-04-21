class GridVisualization extends Renderable{
  
  public GridVisualization(){
  }
  
  // Render loop
  public void render(){
      
      float cellWidth = 5;
      float cellHeight = 5;
      float yOffset = offsetY;
      float xOffset = offsetX;
      // Render a grid
      for(int i =0; i < cells.size(); i++){

        fill(255,0,0); stroke(255);
        rect(xOffset, yOffset,cellWidth,cellHeight);
        xOffset += cellWidth;

        if(xOffset > w+offsetX-cellWidth){
          xOffset = offsetX;
          yOffset += cellHeight;
        }
      }
  }
  
}