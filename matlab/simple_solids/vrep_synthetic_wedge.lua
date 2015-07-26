-- TODO make loops, In a hurry right now, so fuck you Lua and str_concat

if (sim_call_type==sim_childscriptcall_initialization) then
    handle=simGetObjectHandle('STL_Imported')
    final_pose_1=io.open("/home/ratnesh/projects/riss/windows_riss_code/bingham/matlab/simple_solids/data/vrep_synthetic_wedge/quat_1.csv", "w");
    final_pose_euler_1=io.open("/home/ratnesh/projects/riss/windows_riss_code/bingham/matlab/simple_solids/data/vrep_synthetic_wedge/euler_1.csv", "w");
    final_pose_2=io.open("/home/ratnesh/projects/riss/windows_riss_code/bingham/matlab/simple_solids/data/vrep_synthetic_wedge/quat_2.csv", "w");
    final_pose_euler_2=io.open("/home/ratnesh/projects/riss/windows_riss_code/bingham/matlab/simple_solids/data/vrep_synthetic_wedge/euler_2.csv", "w");
    final_pose_3=io.open("/home/ratnesh/projects/riss/windows_riss_code/bingham/matlab/simple_solids/data/vrep_synthetic_wedge/quat_3.csv", "w");
    final_pose_euler_3=io.open("/home/ratnesh/projects/riss/windows_riss_code/bingham/matlab/simple_solids/data/vrep_synthetic_wedge/euler_3.csv", "w");
    final_pose_4=io.open("/home/ratnesh/projects/riss/windows_riss_code/bingham/matlab/simple_solids/data/vrep_synthetic_wedge/quat_4.csv", "w");
    final_pose_euler_4=io.open("/home/ratnesh/projects/riss/windows_riss_code/bingham/matlab/simple_solids/data/vrep_synthetic_wedge/euler_4.csv", "w");
    final_pose_5=io.open("/home/ratnesh/projects/riss/windows_riss_code/bingham/matlab/simple_solids/data/vrep_synthetic_wedge/quat_5.csv", "w");
    final_pose_euler_5=io.open("/home/ratnesh/projects/riss/windows_riss_code/bingham/matlab/simple_solids/data/vrep_synthetic_wedge/euler_5.csv", "w");
 
    count=0;
    threshold = 360*5;
    r2d = 180/math.pi;
    d2r = math.pi/180;
end

if (sim_call_type==sim_childscriptcall_actuation) then
    if count < threshold then 
        local position=simGetObjectPosition(handle,-1)
        local quaternion=simGetObjectQuaternion(handle,-1)
        local orientation=simGetObjectOrientation(handle, -1)
   
        position[1] =  0; 
        position[2] =  0;
        position[3] =  1;
        simSetObjectPosition(handle, -1, position)

        if count < 360 then
            orientation[1] =  0;
            orientation[2] =  0;
            orientation[3] =  count*d2r;

            simSetObjectOrientation(handle,-1,orientation)
            
            local orientation_get = simGetObjectOrientation(handle, -1)
            local quaternion_get = simGetObjectQuaternion(handle, -1)

            final_pose_1:write(quaternion_get[4], "," , quaternion_get[1], ",", quaternion_get[2], ",", quaternion_get[3], "\n")
            final_pose_euler_1:write(r2d*orientation_get[1], ",", r2d*orientation_get[2], ",", r2d*orientation_get[3], "\n")

        elseif count < 360*2 then
            orientation[1] =  180*d2r;
            orientation[2] =  0;
            orientation[3] =  count*d2r;

            simSetObjectOrientation(handle,-1,orientation)
            
            local orientation_get = simGetObjectOrientation(handle, -1)
            local quaternion_get = simGetObjectQuaternion(handle, -1)

            final_pose_2:write(quaternion_get[4], "," , quaternion_get[1], ",", quaternion_get[2], ",", quaternion_get[3], "\n")
            final_pose_euler_2:write(r2d*orientation_get[1], ",", r2d*orientation_get[2], ",", r2d*orientation_get[3], "\n")
       
       elseif count < 360*3 then
            orientation[1] =  270*d2r;
            orientation[2] =  count*d2r;
            orientation[3] =  0;

            simSetObjectOrientation(handle,-1,orientation)
            
            local orientation_get = simGetObjectOrientation(handle, -1)
            local quaternion_get = simGetObjectQuaternion(handle, -1)

            final_pose_3:write(quaternion_get[4], "," , quaternion_get[1], ",", quaternion_get[2], ",", quaternion_get[3], "\n")
            final_pose_euler_3:write(r2d*orientation_get[1], ",", r2d*orientation_get[2], ",", r2d*orientation_get[3], "\n")

        elseif count < 360*4 then
            orientation[1] = 90*d2r;
            orientation[2] = count*d2r;
            orientation[3] = 45*d2r;

            simSetObjectOrientation(handle,-1,orientation)
            
            local orientation_get = simGetObjectOrientation(handle, -1)
            local quaternion_get = simGetObjectQuaternion(handle, -1)

            final_pose_4:write(quaternion_get[4], "," , quaternion_get[1], ",", quaternion_get[2], ",", quaternion_get[3], "\n")
            final_pose_euler_4:write(r2d*orientation_get[1], ",", r2d*orientation_get[2], ",", r2d*orientation_get[3], "\n")        
      
        elseif count < 360*5 then
            orientation[1] = 90*d2r;
            orientation[2] = count*d2r;
            orientation[3] = -45*d2r;

            simSetObjectOrientation(handle,-1,orientation)
            
            local orientation_get = simGetObjectOrientation(handle, -1)
            local quaternion_get = simGetObjectQuaternion(handle, -1)

            final_pose_5:write(quaternion_get[4], "," , quaternion_get[1], ",", quaternion_get[2], ",", quaternion_get[3], "\n")
            final_pose_euler_5:write(r2d*orientation_get[1], ",", r2d*orientation_get[2], ",", r2d*orientation_get[3], "\n")
        end
        count = count+1;
    end
end


if (sim_call_type==sim_childscriptcall_sensing) then

-- Put your main SENSING code here

end


if (sim_call_type==sim_childscriptcall_cleanup) then
   
-- Put some restoration code here

end