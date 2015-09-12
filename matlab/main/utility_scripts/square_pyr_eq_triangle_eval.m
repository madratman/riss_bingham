for i=1:5
  eval(['square_pyr_eq_triangle_face_' num2str(i) '= zeros(360,3);'])
end

for j = 1:4
	for i = 1:360
		if j==1
			eval(['square_pyr_eq_triangle_face_' num2str(j) '(i, :)= [0 120 i-1];'])
		elseif j==2
			eval(['square_pyr_eq_triangle_face_' num2str(j) '(i, :)= [0 -120 i-1];'])
		elseif j==3
			eval(['square_pyr_eq_triangle_face_' num2str(j) '(i, :)= [120 0 i-1];'])	
		elseif j==4
			eval(['square_pyr_eq_triangle_face_' num2str(j) '(i, :)= [-120 0 i-1];'])		
		end
	end
end

for i = 1:360
	square_pyr_eq_triangle_face_5(i, :) = [0 0 i-1];
end



for i = 1:5
	eval(['quat_square_pyr_eq_triangle_face_' num2str(i) '= eulerToQuaternion(square_pyr_eq_triangle_face_' num2str(i) ');'])
end

for i = 1:5
	eval(['bing_square_pyr_eq_triangle_face_' num2str(i) '= bingham_fit(quat_square_pyr_eq_triangle_face_' num2str(i) ');'])
end

