function tf = transformationMatrix(x, y, theta)
    tf = [cos(theta), -sin(theta), x; sin(theta), cos(theta), y; 0, 0, 1]
end