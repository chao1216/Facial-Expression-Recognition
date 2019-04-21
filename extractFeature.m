function v = extractFeature(trainingSet)

v = zeros(1,1024);

for i = 1:trainingSet.Count
    im = read(trainingSet, i);
    face_detect = vision.CascadeObjectDetector('FrontalFaceLBP');
    face_detect.MergeThreshold = 10;
    bbox = step(face_detect, im);
    face = imcrop(im, bbox);
    face = imresize(face, [180,180]);
    feature_vec = decompose_LBP(face);
    v = floor((v + feature_vec) / 2);
end
