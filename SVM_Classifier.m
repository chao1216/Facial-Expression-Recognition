clc;
close all;

ha_dir=('/Users/chaolin/Documents/EE4830/FER/Facial-Expression-Recognition/jaffe/happy');
sa_dir=('/Users/chaolin/Documents/EE4830/FER/Facial-Expression-Recognition/jaffe/sad');
su_dir=('/Users/chaolin/Documents/EE4830/FER/Facial-Expression-Recognition/jaffe/surprise');
fe_dir=('/Users/chaolin/Documents/EE4830/FER/Facial-Expression-Recognition/jaffe/fear');
an_dir=('/Users/chaolin/Documents/EE4830/FER/Facial-Expression-Recognition/jaffe/anger');
di_dir=('/Users/chaolin/Documents/EE4830/FER/Facial-Expression-Recognition/jaffe/disgust');
ne_dir=('/Users/chaolin/Documents/EE4830/FER/Facial-Expression-Recognition/jaffe/neutral');


ha_trainingSet = imageSet(ha_dir,'recursive');
sa_trainingSet = imageSet(sa_dir,'recursive');
su_trainingSet = imageSet(su_dir,'recursive');
fe_trainingSet = imageSet(fe_dir,'recursive');
an_trainingSet = imageSet(an_dir,'recursive');
di_trainingSet = imageSet(di_dir,'recursive');
ne_trainingSet = imageSet(di_dir,'recursive');

disp("extracting happy...");
[happy, ha_l1, ha_l2, ha_l3] = extractFeature(ha_trainingSet, 'HS', 'Happy', 'None');
disp("extracting sad...");
[sad, sa_l1, sa_l2, sa_l3] = extractFeature(sa_trainingSet, 'DUFA', 'UF', 'Sad');
disp("extracting surprise...");
[surprise, su_l1, su_l2, su_l3] = extractFeature(su_trainingSet, 'HS', 'Surprise', 'None');
disp("extracting fear...");
[fear, fe_l1, fe_l2, fe_l3] = extractFeature(fe_trainingSet, 'DUFA', 'UF', 'Fear');
disp("extracting anger...");
[anger, an_l1, an_l2, an_l3] = extractFeature(an_trainingSet, 'DUFA', 'AD', 'Anger');
disp("extracting disgust...");
[disgust, di_l1, di_l2, di_l3] = extractFeature(di_trainingSet, 'DUFA', 'AD', 'Disgust');
%disp("extracting neutral...");
%[neutral, ne_label] = extractFeature(di_trainingSet, 'neutral');


%classes = {ha_label, sa_label, su_label, fe_label, an_label, di_label};
%classes = cat(2, classes{:});
%training = [happy; sad; surprise; fear; anger; disgust];


HS_DUFA_Training = [happy; surprise; anger; disgust; sad; fear];
HS_DUFA_Classes = {ha_l1, su_l1, an_l1, di_l1, sa_l1, fe_l1};
HS_DUFA_Classes = cat(2, HS_DUFA_Classes{:});

HS_Training = [happy; surprise];
HS_Classes = {ha_l2, su_l2};
HS_Classes = cat(2, HS_Classes{:});

DUFA_Training = [anger; disgust; sad; fear];
DUFA_Classes = {an_l2, di_l2, sa_l2, fe_l2};
DUFA_Classes = cat(2, DUFA_Classes{:});

AD_Training = [anger; disgust];
AD_Classes = {an_l3, di_l3};
AD_Classes = cat(2, AD_Classes{:});

UF_Training = [sad; fear];
UF_Classes = {sa_l3, fe_l3};
UF_Classes = cat(2, UF_Classes{:});

HS_DUFA = fitcecoc(HS_DUFA_Training, HS_DUFA_Classes);
save HS_DUFA_classifier.mat HS_DUFA;

HS = fitcecoc(HS_Training, HS_Classes);
save HS_classifier.mat HS;

DU_FA = fitcecoc(DUFA_Training, DUFA_Classes);
save DUFA_classifier.mat DU_FA;

AD = fitcecoc(AD_Training, AD_Classes);
save AD_classifier.mat AD;

UF = fitcecoc(UF_Training, UF_Classes);
save UF_classifier.mat UF;













