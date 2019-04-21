function s = evaluate(testSet, label)
load('svm_classifier.mat');
s = 0;
for i = 1:testSet.Count
    im = read(testSet, i);
    face_detect = vision.CascadeObjectDetector('FrontalFaceLBP');
    face_detect.MergeThreshold = 10;
    bbox = step(face_detect, im);
    face = imcrop(im, bbox);
    face = imresize(face, [180,180]);
    feature_vec = decompose_LBP(face);
    predictedLabel = predict(svm_classifier, feature_vec);
    if strcmp(predictedLabel{1}, label)
        s = s + 1;
    end
end