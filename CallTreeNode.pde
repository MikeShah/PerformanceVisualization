/*
  Purpose: CallTreeNode stores information about a method   
*/

class CallTreeNode{
    String m_methodName;  // Name of the method. TODO: Change this to 'm_methodName'
    String m_totalTime;
    int Invocations;
    CallTreeNode parent;
    float timeOfMethodEntry;  // This is the time at which the method was called. This is useful for linearizing the nodes in chronological order on the hilbert curve.
    
    int level; // Level the node is at in the tree, such that we can pretty print it
    
    // Child nodes
    ArrayList<CallTreeNode> children;
    
    // If set to 0, then do not highlight the nodes in the visualization
    // If set to 1, then highlight in yellow in the visualization
    // If set to 2, then highlight in green in the visualization
    // If set to 3, then highlight in red in the visualization
    int highlighted = 0;

    // Called in the constructor of the tree.
    public void init(){
            parent = null;
            children = new ArrayList<CallTreeNode>();
            
            m_totalTime = "n/a";
            level = 0;
    }
    
    // Default constructor
    public CallTreeNode(){
        init();
    }
    
    public CallTreeNode(String method_name){
        init();
        m_methodName = method_name;
    }
    
    // Adds a child node to children
    public void addChild(CallTreeNode c){
       children.add(c);
    }
    
    // Returns a dump of the nodes information.
    public String printNode(){
      
      String parentMethod = "null";
      if(parent!=null && parent.m_methodName != null ){
        parentMethod = parent.m_methodName;
      }
      
      String result = "Method: "+m_methodName + "\n" +
                      "Time: "+m_totalTime + "\n" +
                      "Invocations: "+Invocations + "\n" +
                      "Parent Method: "+parentMethod + "\n" +
                      "Time of Entry: "+timeOfMethodEntry;
      return result;
    }
}

/*

    Purpose: The CallTree Node class loads in a call tree, and stores
             an internal tree structure.
             
             The Call Tree is a directed acyclic graph, hench the name. 
             It does not make sense for it to have cycles.
*/