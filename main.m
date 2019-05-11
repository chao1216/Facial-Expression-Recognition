clc;
close all;

load('HS_DUFA_classifier.mat');
load('HS_classifier.mat');
load('DUFA_classifier.mat');
load('AD_classifier.mat');
load('UF_classifier.mat');

test = imread('./DIP/anger/guo_an1_gs.jpg');
figure, imshow(test);

face = vision.CascadeObjectDetector('FrontalFaceLBP');
face.MergeThreshold = 5;
bbox = step(face, test);
disp("hi");
face_im = imcrop(test, bbox);
disp("yo");
face_im = imresize(face_im, [180,180]);
figure, imshow(face_im);
feature_vec = decompose_LBP(face_im);

predicted_label = {};
label1 = predict(HS_DUFA, feature_vec);
if strcmp(label1{1}, 'HS')
    predicted_label = predict(HS, feature_vec);
else 
    label2 = predict(DU_FA, feature_vec);
    if strcmp(label2{1}, 'AD')
        predicted_label = predict(AD, feature_vec);
    else
        predicted_label = predict(UF, feature_vec);
    end
end
disp(predicted_label{1});




