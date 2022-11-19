function rotMat = R(theta)
    % creates a rotation matrix based on an angle theta (radians)
    rotMat = [cos(theta), -sin(theta); sin(theta), cos(theta)];
end

