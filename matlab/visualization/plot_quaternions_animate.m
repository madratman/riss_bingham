function plot_quaternions_animate(quat)

class_quat = quaternion(quat); 
PlotRotation(class_quat, 0.0001)
axis equal;
axis vis3d;