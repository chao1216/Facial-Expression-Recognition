clc;
close all;

load('svm_classifier.mat');
test = imread('./jaffe/test/disgust/KA.DI3.44.tiff');
figure, imshow(test);
face = vision.CascadeObjectDetector('FrontalFaceLBP');
face.MergeThreshold = 10;
bbox = step(face, test);
face_im = imcrop(test, bbox);
face_im = imresize(face_im, [180,180]);
feature_vec = decompose_LBP(face_im);

predictedLabel = predict(svm_classifier, feature_vec);
if strcmp(predictedLabel{1}, "disgust")
    disp("yes")
end
