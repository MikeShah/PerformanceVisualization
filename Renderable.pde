
/*
  Purpose: Add a renderable component to an object
*/
class Renderable extends DataLayer{
  
  // The 0,0 coordinate of the top-left of the component
  float offsetX,offsetY;
  float w,h;
  
  public Renderable(){
    w = 10;
    h = 10;
  }
  
  // Sets the offsets from the parent widget
  // This is ideally called before we render and move a widget
  void getOffsets(float offsetX, float offsetY){
    this.offsetX = offsetX;
    this.offsetY = offsetY;
  }
  
  // Render loop (This should ideally be overrideen)
  void render(){
      
  }
  
}