clc;
close all;

ha_dir=('/Users/chaolin/Documents/EE4830/FER/Facial-Expression-Recognition/jaffe/happy');
sa_dir=('/Users/chaolin/Documents/EE4830/FER/Facial-Expression-Recognition/jaffe/sad');
su_dir=('/Users/chaolin/Documents/EE4830/FER/Facial-Expression-Recognition/jaffe/surprise');
fe_dir=('/Users/chaolin/Documents/EE4830/FER/Facial-Expression-Recognition/jaffe/fear');
an_dir=('/Users/chaolin/Documents/EE4830/FER/Facial-Expression-Recognition/jaffe/anger');
di_dir=('/Users/chaolin/Documents/EE4830/FER/Facial-Expression-Recognition/jaffe/disgust');


ha_trainingSet = imageSet(ha_dir,'recursive');
sa_trainingSet = imageSet(sa_dir,'recursive');
su_trainingSet = imageSet(su_dir,'recursive');
fe_trainingSet = imageSet(fe_dir,'recursive');
an_trainingSet = imageSet(an_dir,'recursive');
di_trainingSet = imageSet(di_dir,'recursive');

[happy, ha_label] = extractFeature(ha_trainingSet, "happy");
[sad, sa_label] = extractFeature(sa_trainingSet, "sad");
[surprise, su_label] = extractFeature(su_trainingSet, "surprise");
[fear, fe_label] = extractFeature(fe_trainingSet, "fear");
[anger, an_label] = extractFeature(an_trainingSet, "anger");
[disgust, di_label] = extractFeature(di_trainingSet, "disgust");

classes = [ha_label; sa_label; su_label; fe_label; an_label; di_label];
training = [happy; sad; surprise; fear; anger; disgust];

svm_classifier = fitcecoc(training, classes);
save svm_classifier.mat svm_classifier;







