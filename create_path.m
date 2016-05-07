function [p] = create_path()

    TNodePath = struct('node',0,'weight',0.0);
    TPath = struct('points', TNodePath);
    
    p = TPath;
  
end