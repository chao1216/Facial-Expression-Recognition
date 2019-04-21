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

happy = extractFeature(ha_trainingSet);
sad = extractFeature(sa_trainingSet);
surprise = extractFeature(su_trainingSet);
fear = extractFeature(fe_trainingSet);
anger = extractFeature(an_trainingSet);
disgust = extractFeature(di_trainingSet);

classes = ["happy","sad","surprise","fear","anger","disgust"];
training = [happy; sad; surprise; fear; anger; disgust];

svm_classifier = fitcecoc(training, classes);
save svm_classifier.mat svm_classifier;







