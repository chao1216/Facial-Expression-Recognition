clc;
close all;

load('svm_classifier.mat');
test = imread('./me/di_vince.png');
test = rgb2gray(test);
figure, imshow(test);
face = vision.CascadeObjectDetector('FrontalFaceLBP');
face.MergeThreshold = 5;
bbox = step(face, test);
face_im = imcrop(test, bbox);
size(face_im)
face_im = imresize(face_im, [180,180]);
figure, imshow(face_im);
feature_vec = decompose_LBP(face_im);

predictedLabel = predict(svm_classifier, feature_vec)
