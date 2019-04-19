clc;
close all;
happy = imread('./jaffe/YM.HA3.54.tiff');
sad = imread('./jaffe/YM.SA3.57.tiff');

face = vision.CascadeObjectDetector('FrontalFaceLBP');
face.MergeThreshold = 3;
bbox_happy = step(face, happy);
happy_face = imcrop(happy, bbox_happy);

bbox_sad = step(face, sad);
sad_face = imcrop(sad, bbox_sad);

happy_face = imresize(happy_face, [180,180]);
sad_face = imresize(sad_face, [180,180]);

happy_vec = decompose_LBP(happy_face);
sad_vec = decompose_LBP(sad_face);


%{
[g,v] = LBP_clkwise(face);
[g1,v1] = LBP_counter_clkwise(face);

figure, imshow(g);
figure, bar(v);

figure, imshow(g1);
figure, bar(v1);
%}