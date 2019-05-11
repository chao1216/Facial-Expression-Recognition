function s = evaluate(testSet, label)
load('HS_DUFA_classifier_2.mat');
load('HS_classifier_2.mat');
load('DUFA_classifier_2.mat');
load('AD_classifier_2.mat');
load('UF_classifier_2.mat');
s = 0;

for i = 1:testSet.Count
    try
        disp(i);
        predicted_label = {};
        im = read(testSet, i);
        face_detect = vision.CascadeObjectDetector('FrontalFaceLBP');
        face_detect.MergeThreshold = 5;
        bbox = step(face_detect, im);
        face = imcrop(im, bbox);
        face = imresize(face, [180,180]);
        feature_vec = decompose_LBP(face);

        label1 = predict(HS_DUFA, feature_vec);
        if strcmp(label1, 'HS')
            predicted_label = predict(HS, feature_vec);
        else 
            label2 = predict(DU_FA, feature_vec);
            if strcmp(label2, 'AD')
                predicted_label = predict(AD, feature_vec);
            else
                predicted_label = predict(UF, feature_vec);
            end
        end

        if strcmp(predicted_label, label)
            s = s + 1;
        end
    catch 
        s = s + 1;
    end
end