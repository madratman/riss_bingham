function [a_euler, b_euler, c_euler, d_euler, e_euler, f_euler, a_init_euler, b_init_euler, c_init_euler, d_init_euler, e_init_euler, f_init_euler, total] = classify_quat_orientation_euler(init_quat, final_quat_clean, init_euler, final_euler)

[a_euler,b_euler,c_euler,d_euler,e_euler,f_euler,total] = deal([]);
[a_init_euler,b_init_euler,c_init_euler,d_init_euler,e_init_euler,f_init_euler] = deal([]);

for(i=1:size(final_quat_clean, 1))
	%final_quat_clean = [0 _ _ 0]. Corresponds to [+-180  0  ___] roll pitch yaw.
	if(final_quat_clean(i,1)==0 && final_quat_clean(i,4)==0)
		a_euler = [a_euler; final_euler(i,:)];
		a_init_euler = [a_init_euler; init_euler(i, :)];
	end

	%final_quat_clean = [x x y y]
	if(final_quat_clean(i,1)==final_quat_clean(i,2) && final_quat_clean(i,3)==final_quat_clean(i,4))
		b_euler = [b_euler; final_euler(i,:)];
		b_init_euler = [b_init_euler; init_euler(i, :)];
	end

	%final_quat_clean = [x -x y -y]
	if(final_quat_clean(i,1)== -final_quat_clean(i,2) && final_quat_clean(i,3)== -final_quat_clean(i,4))
		c_euler = [c_euler; final_euler(i,:)];
		c_init_euler = [c_init_euler; init_euler(i, :)];
	end

	%final_quat_clean = [x y -x y]
	if(final_quat_clean(i,1)== -final_quat_clean(i,3) && final_quat_clean(i,2)==final_quat_clean(i,4))
		d_euler = [d_euler; final_euler(i,:)];
		d_init_euler = [d_init_euler; init_euler(i, :)];	
	end

	%final_quat_clean = [x y x -y]
	if(final_quat_clean(i,1)== final_quat_clean(i,3) && final_quat_clean(i,2)== -final_quat_clean(i,4))
		e_euler = [e_euler; final_euler(i,:)];
		e_init_euler = [e_init_euler; init_euler(i, :)];
    end
    
    %final_quat_clean = [_ 0 0 _]. Corresponds to [0 0 ___] roll pitch yaw
	if(final_quat_clean(i,2)== 0 && final_quat_clean(i,3)== 0)
		f_euler = [f_euler; final_euler(i,:)];
		f_init_euler = [f_init_euler; init_euler(i, :)];
    end
end

total = size(a_euler,1) + size(b_euler,1) + size(c_euler,1) + size(d_euler,1) + size(e_euler,1) + size(f_euler,1)

end
