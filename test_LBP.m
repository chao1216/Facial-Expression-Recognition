clc;
close all;
f = imread('./jaffe/YM.SU3.60.tiff');

face = vision.CascadeObjectDetector('FrontalFaceLBP');
face.MergeThreshold = 3;
bbox = step(face, f);
face = imcrop(f, bbox);
face = imresize(face, [180,180]);
figure, imshow(face);

[g,v] = LBP_clkwise(face);
[g1,v1] = LBP_counter_clkwise(face);

figure, imshow(g);
figure, bar(v);

figure, imshow(g1);
figure, bar(v1);

%LBP = extractLBPFeatures(f);
%figure, bar(LBP);