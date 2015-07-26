-- DO NOT WRITE CODE OUTSIDE OF THE if-then-end SECTIONS BELOW!! (unless the code is a function definition)

if (sim_call_type==sim_childscriptcall_initialization) then
    handle=simGetObjectHandle('Cuboid')
    final_pose=io.open("/home/ratnesh/projects/riss/windows_riss_code/bingham/matlab/simple_solids/data/vrep_exp_cube_0.35/7_drop_one_circle_bing_samples/final_quat.csv", "w");

    count=0;
    -- debug=0;
    no_of_trials = 10000;
    threshold = 100*(no_of_trials+1);
    threshold_final_pose = 100*no_of_trials;
    r2a = 180/math.pi;

    csv={}
    for line in io.lines('/home/ratnesh/projects/riss/windows_riss_code/bingham/matlab/simple_solids/data/vrep_exp_cube_0.35/7_drop_one_circle_bing_samples/init_quat.csv') do
        table.insert(csv, {})
        local i=1
        for j=1,#line do
            if line:sub(j,j) == ',' then
                table.insert(csv[#csv], line:sub(i,j-1))
                i=j+1
            end
        end
        table.insert(csv[#csv], line:sub(i,j))
    end

end


if (sim_call_type==sim_childscriptcall_actuation) then
    if count < threshold then 
        local position=simGetObjectPosition(handle,-1)
        local quaternion_final=simGetObjectQuaternion(handle,-1)
        local orientation=simGetObjectOrientation(handle, -1)

        if (count%100==0) then

            if count ~= 0 then 
                -- no final pose written at the beginning of the simulation 
               final_pose:write(count/100,",", quaternion_final[4], ","
                    , quaternion_final[1], ",", quaternion_final[2], ",", quaternion_final[3], "\n")
            end

            position[1] =  0; 
            position[2] =  0;
            position[3] =  1;
            simSetObjectPosition(handle,-1,position);

            --because setting random orientation via euler angles is easier than setting it via random quaternions
            local quaternion_init = simGetObjectQuaternion(handle,-1) --just initialize to anything. Doesn't matter!
            quaternion_init[4] = csv[(count/100)+1][1]
            quaternion_init[1] = csv[(count/100)+1][2]
            quaternion_init[2] = csv[(count/100)+1][3]
            quaternion_init[3] = csv[(count/100)+1][4]
            simSetObjectQuaternion(handle, -1, quaternion_init)
               
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