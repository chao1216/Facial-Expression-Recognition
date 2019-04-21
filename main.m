clc;
close all;

test_anger = imread('./jaffe/testing/YM.AN3.63.tiff');
face = vision.CascadeObjectDetector('FrontalFaceLBP');
face.MergeThreshold = 10;
bbox = step(face, test_anger);
anger_face = imcrop(test_anger, bbox);
anger_face = imresize(anger_face, [180,180]);
anger_vec = decompose_LBP(anger_face);

predictedLabel = predict(svm_classifier, anger_vec)
