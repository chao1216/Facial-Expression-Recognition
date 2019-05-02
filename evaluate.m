function s = evaluate(testSet, label)
load('HS_DUFA_classifier.mat');
load('HS_classifier.mat');
load('DUFA_classifier.mat');
load('AD_classifier.mat');
load('UF_classifier.mat');
s = 0;

for i = 1:testSet.Count
    predicted_label = {};
    im = read(testSet, i);
    face_detect = vision.CascadeObjectDetector('FrontalFaceLBP');
    face_detect.MergeThreshold = 10;
    bbox = step(face_detect, im);
    face = imcrop(im, bbox);
    face = imresize(face, [180,180]);
    feature_vec = decompose_LBP(face);
    
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
    
    if strcmp(predicted_label{1}, label)
        s = s + 1;
    end
end