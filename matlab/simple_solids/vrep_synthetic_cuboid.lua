-- DO NOT WRITE CODE OUTSIDE OF THE if-then-end SECTIONS BELOW!! (unless the code is a function definition)

if (sim_call_type==sim_childscriptcall_initialization) then
    handle=simGetObjectHandle('Cuboid')
    final_pose=io.open("/home/ratnesh/projects/riss/windows_riss_code/bingham/matlab/simple_solids/data/vrep_synthetic_cube/1/quat.csv", "w");
    final_pose_euler=io.open("/home/ratnesh/projects/riss/windows_riss_code/bingham/matlab/simple_solids/data/vrep_synthetic_cube/1/euler.csv", "w");
    count=0;
    threshold = 360;
    r2a = 180/math.pi;
    a2r = math.pi/180;
end


if (sim_call_type==sim_childscriptcall_actuation) then
    if count < threshold then 
        local position=simGetObjectPosition(handle,-1)
        local quaternion=simGetObjectQuaternion(handle,-1)
        local orientation=simGetObjectOrientation(handle, -1)
   
        position[1] =  0; 
        position[2] =  0;
        position[3] =  1;
        
        if count<360 then
            orientation[1] =  0;
            orientation[2] =  0*a2r;
            orientation[3] =  count*a2r;

        elseif  count<(360*2) then
            orientation[1] =  0;
            orientation[2] =  180*a2r;
            orientation[3] =  count*a2r;

        elseif  count<(360*3) then
            orientation[1] =  0;
            orientation[2] =  180*a2r;
            orientation[3] =  count*a2r;

        elseif  count<(360*4) then
            orientation[1] =  0;
            orientation[2] =  180*a2r;
            orientation[3] =  count*a2r;

        elseif  count<(360*5)then
            orientation[1] =  0;
            orientation[2] =  180*a2r;
            orientation[3] =  count*a2r;

        elseif  count<(360*6) then
            orientation[1] =  0;
            orientation[2] =  180*a2r;
            orientation[3] =  count*a2r;
        end
        
        simSetObjectPosition(handle,-1,position)
        simSetObjectOrientation(handle,-1,orientation)

        quat_test = simGetObjectQuaternion(handle, -1)
        orientation_get = simGetObjectOrientation(handle, -1)
        final_pose:write(quaternion[1], "," , quaternion[2], ",", quaternion[3], ",", quaternion[4], "\n")
        final_pose_euler:write(r2a*orientation_get[1], ",", r2a*orientation_get[2], ",", r2a*orientation_get[3], "\n")

        count = count+1;
    end

end


if (sim_call_type==sim_childscriptcall_sensing) then

-- Put your main SENSING code here

end


if (sim_call_type==sim_childscriptcall_cleanup) then
    erlFile:close()

-- Put some restoration code here

end