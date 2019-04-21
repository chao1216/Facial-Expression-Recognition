clc;
close all;

load('svm_classifier.mat');
test_anger = imread('./jaffe/testing/KA.DI3.44.tiff');
figure, imshow(test_anger);
face = vision.CascadeObjectDetector('FrontalFaceLBP');
face.MergeThreshold = 10;
bbox = step(face, test_anger);
anger_face = imcrop(test_anger, bbox);
anger_face = imresize(anger_face, [180,180]);
anger_vec = decompose_LBP(anger_face);

predictedLabel = predict(svm_classifier, anger_vec)
