function [t_feature, t_label] = extractFeature(trainingSet, label)

v = zeros(1,1024);
v = [];

t_feature = [];
t_label = [];
for i = 1:trainingSet.Count
    im = read(trainingSet, i);
    face_detect = vision.CascadeObjectDetector('FrontalFaceLBP');
    face_detect.MergeThreshold = 10;
    bbox = step(face_detect, im);
    face = imcrop(im, bbox);
    face = imresize(face, [180,180]);
    training_feature = decompose_LBP(face);
    t_feature = [t_feature; training_feature];
    t_label = [t_label; label];
end


