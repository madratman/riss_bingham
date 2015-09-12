plot_bingham_rotations_poster(bing_uniform, 1000)
set(gcf, 'Color', 'w');
export_fig bing_uniform.jpg -r300

close
bing_custom = bing_uniform
bing_custom.Z = [-900 -900 0]
plot_bingham_rotations_poster(bing_custom, 1000)
set(gcf, 'Color', 'w');
export_fig bing_900_900_0.jpg -r300

close
bing_custom.Z = [-900 0 -900]
plot_bingham_rotations_poster(bing_custom, 1000)
set(gcf, 'Color', 'w');
export_fig bing_900_0_900.jpg -r300

close
bing_custom.Z = [0 -900 -900]
plot_bingham_rotations_poster(bing_custom, 1000)
set(gcf, 'Color', 'w');
export_fig bing_0_900_900.jpg -r300

close
bing_custom.Z = [-900 -900 -900]
plot_bingham_rotations_poster(bing_custom, 1000)
set(gcf, 'Color', 'w');
export_fig bing_900_900_900.jpg -r300

close
bing_custom.Z = [-900 -900 -20]
plot_bingham_rotations_poster(bing_custom, 1000)
set(gcf, 'Color', 'w');
export_fig bing_900_900_20.jpg -r300

close
bing_custom.Z = [-900 -100 -20]
plot_bingham_rotations_poster(bing_custom, 1000)
set(gcf, 'Color', 'w');
export_fig bing_900_100_20.jpg -r300

close
bing_custom.Z = [-900 -20 -20]
plot_bingham_rotations_poster(bing_custom, 1000)
set(gcf, 'Color', 'w');
export_fig bing_900_20_20.jpg -r300

close
plot_quaternions_rotations_poster(face_1_init)
set(gcf, 'Color', 'w');
export_fig face_1_init.jpg -r300

close
plot_bingham_cluster_poster(face_6_init_fitted_BMM, 500, 'rotations')
set(gcf, 'Color', 'w');
export_fig face_1_init_BM.jpg -r300

%recall previous workspaces' index bug
test = {face_final_6, face_final_1, face_final_2, face_final_3, face_final_4, face_final_5}
plot_quaternions_cluster_poster(test, 'rotations')
set(gcf, 'Color', 'w');
export_fig final_quat_cluster.jpg -r300

plot_bingham_cluster_poster(bing_syn_vrep_cluster, 500, 'rotations')
%tilt slightly
set(gcf, 'Color', 'w');
export_fig final_BMM_cluster.jpg -r300