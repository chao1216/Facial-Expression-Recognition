function [t_feature, l1_label, l2_label, l3_label] = extractFeature(trainingSet, label1, label2, label3)

v = zeros(1,1024);
v = [];

t_feature = [];
l1_label = [];
l2_label = [];
l3_label = [];

for i = 1:trainingSet.Count
    im = read(trainingSet, i);
    try
        disp(i);
        face_detect = vision.CascadeObjectDetector('FrontalFaceLBP');
        face_detect.MergeThreshold = 5;
        bbox = step(face_detect, im);
        face = imcrop(im, bbox);
        face = imresize(face, [180,180]);
        training_feature = decompose_LBP(face);
        t_feature = [t_feature; training_feature];

        %{
        l1_label{end+1} = label1;
        l2_label{end+1} = label2;
        l3_label{end+1} = label3;
        %} 

        l1_label = [l1_label, label1];
        l2_label = [l2_label, label2];
        l3_label = [l3_label, label3];
    catch
        figure, imshow(im);
    end
end


