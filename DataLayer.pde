/*
  
    Purpose: Single place to inherit data from

*/
import java.util.*;
import java.util.concurrent.*;


class DataLayer{
 
   // This needs to be thread-safe, because we clear the cells and also render them at the same time.
   CopyOnWriteArrayList<Cell> cells;  
    
   CallTree myCallTree;                    // Actual tree representation 
   ArrayList<CallTreeNode> LinearCallTree; // A flattened tree that can be mapped to the Hilbert Curve (essentially bfs tree, then sorted by time)
    
     
   public DataLayer(){
      cells = new CopyOnWriteArrayList<Cell>();
      
      // Load the Call Tree and add cells based on that data
      myCallTree = new CallTree();
      myCallTree.load("/Users/michaelshah/Desktop/Snapshots/JVisualVM.csv");
      // Linearize the tree
      LinearCallTree = myCallTree.getLinearTree();
      
      // For each node in the tree, we create a cell, that is the renderable component in the visualization.
      for(int i=0; i < LinearCallTree.size(); i++){
        cells.add(new Cell(LinearCallTree.get(i).m_methodName));
      }
   }
  
   void addcell(Cell c){
     cells.add(c);
   }
   
   // Get the list of cells and transform them
   CopyOnWriteArrayList<Cell> getCells(){
     return cells;
   }
  
   // Get all of the cells, and set them to a new set
   // This is one way to copy all the cells from one visualization to another
   void setCells(ArrayList<Cell> newCells){
     // Remove our old list of cells
     cells.clear();
     
     // Set our new list
     for(int i=0; i < newCells.size();++i){
         cells.add(newCells.get(i));
     }
   }
   
   // Traverses all of the cells and their children
   // Performs a breadth-first search
   void traverseCells(){
       Queue<Cell> bfs = new LinkedList<Cell>();
       
       // Populate our Queue with the roots
       for(int i =0; i < cells.size();++i){
         bfs.add(cells.get(i));
       }
       
       while(!bfs.isEmpty()){
          Cell current = bfs.remove();
          for(int i =0; i < current.metaData.children.size(); ++i){
             bfs.add(current.metaData.children.get(i));
          }
          println(current.metaData.name);
       }
       
   }
   
}