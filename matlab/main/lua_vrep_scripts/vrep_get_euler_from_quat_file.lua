-- DO NOT WRITE CODE OUTSIDE OF THE if-then-end SECTIONS BELOW!! (unless the code is a function definition)

if (sim_call_type==sim_childscriptcall_initialization) then
    handle=simGetObjectHandle('Cuboid')
    final_pose=io.open("/home/ratnesh/projects/riss/windows_riss_code/bingham/matlab/simple_solids/data/vrep_synthetic_cube/get_euler/quat.csv", "w");
    final_pose_euler=io.open("/home/ratnesh/projects/riss/windows_riss_code/bingham/matlab/simple_solids/data/vrep_synthetic_cube/get_euler/euler.csv", "w");
	count=0;
    threshold = 360*6;
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

		local csv={}
		for line in io.lines('/home/ratnesh/projects/riss/windows_riss_code/bingham/data/cuboid/20150708T102827/cuboid_face_1_final.csv') do
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

        simSetObjectPosition(handle, -1, position)
        --simSetObjectOrientation(handle,-1,orientation)
		quaternion[4] = csv[count+1][1]
		quaternion[1] = csv[count+1][2]
		quaternion[2] = csv[count+1][3]
		quaternion[3] = csv[count+1][4]
		
		simSetObjectQuaternion(handle, -1, quaternion)
		
		simGetObjectOrientation(handle, -1)
		--quat_test = simGetObjectQuaternion(handle, -1)
		--orientation = simGetObjectOrientation(handle, -1)
        --final_pose:write(quaternion[1], "," , quaternion[2], ",", quaternion[3], ",", quaternion[4], "\n")
        final_pose_euler:write(r2a*orientation[1], ",", r2a*orientation[2], ",", r2a*orientation[3], "\n")

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