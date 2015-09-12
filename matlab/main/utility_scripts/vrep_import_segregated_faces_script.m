% TODO make it a function with path as parameter. 
% For now, just cd into the time stamped folder. :)
% WARNING You MUST cd into the time stamped folder. 
% Or else you ll just import stuff from the first folder Matlab
% traverses to 
% function vrep_import_segregated_faces_script

% This script is kinda redundant. It does the same job as 
% vrep_scripts/classify_quat_orientation.m
% I made this as I lost the complete data from the VRep experiments
% with 6000 drops. But I do have the segregated csv files(and variables 
% as well in another workspace.) 
% This dumbass script just imports them 

% Ending the rant, it is actually useful to import data given the 
% path to the time-stamped folder.
% That's how you arrive somewhere but not here. (It is a song by 
% Porcupine Tree. Go listen to it right now!

% Now the bad thing here is I can't have the random order (it is not
% as per the experiment.

% But at least, now I can see how well a BMM fits as compared to that
% versus this "ordered" data. 

% Edit : Found it!
for i = 1:6
    eval(['face_final_' num2str(i) '= importdata(''cuboid_face_' num2str(i) '_final.csv'');'])
    eval(['face_init_' num2str(i) '= importdata(''cuboid_face_' num2str(i) '_init.csv'');'])
end

faces_final_all_ordered = [face_final_1;
                   face_final_2;
                   face_final_3;
                   face_final_4;
                   face_final_5;
                   face_final_6]
               
faces_init_all_ordered = [face_init_1;
                   face_init_2;
                   face_init_3;
                   face_init_4;
                   face_init_5;
                   face_init_6]
               