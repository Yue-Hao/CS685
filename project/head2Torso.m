function vec3d_torso = head2Torso(vec3d_head, roll, yaw)

vec3d_torso = RotateMatrix(roll, 0, yaw) * vec3d_head;

end