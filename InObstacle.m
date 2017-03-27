%Collision check
%Since the edge collision check always cause computer stuck and the program
%can get decent result without, I did not apply it in this program. 

function logic = InObstacle(NodeNear,NodeTemp)

obstacles = load ('obstacles.txt'); % load obstacle data

%draw obstacles in graph
drawCircle(obstacles);

%find the number of obstacles
N = length(obstacles(:,1));

logic = false;

for i = 1 : N
    
    OB = obstacles(i,:);
    
    %distance between obstacle center to new Node
    dist = sqrt((NodeTemp.x - OB(1))^2 + (NodeTemp.y - OB(2))^2);
    
    %distance between obstacle to new Edge
    Center.x = OB(1);
    Center.y = OB(2);
    
    distToEdge = lineToCenter(NodeNear,NodeTemp,Center);
    
   if dist <= OB(3)
  % if distToEdge <=OB(3) || dist <=OB(3)
        logic = true;
        break;
    end 

end
