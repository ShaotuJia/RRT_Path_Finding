function dist  = lineToCenter(NodeNear , NodeTemp , Center)

 %distance between obstacle center to the line of NodeTemp and NodeNear
    VectorNearToCenter = [Center.x-NodeNear.x Center.y-NodeNear.y];
    VectorNearToTemp = [NodeTemp.x-NodeNear.x NodeTemp.y-NodeNear.y];
    
    CrossProduct = VectorNearToCenter(1)*VectorNearToTemp(2) - VectorNearToCenter(2)*VectorNearToTemp(1);
    lineToCenter = abs(CrossProduct)/norm(VectorNearToTemp); 
    dist = lineToCenter;


end