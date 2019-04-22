clc;
close all;

ha_dir=('/Users/chaolin/Documents/EE4830/FER/Facial-Expression-Recognition/jaffe/test/happy');
sa_dir=('/Users/chaolin/Documents/EE4830/FER/Facial-Expression-Recognition/jaffe/test/sad');
su_dir=('/Users/chaolin/Documents/EE4830/FER/Facial-Expression-Recognition/jaffe/test/surprise');
fe_dir=('/Users/chaolin/Documents/EE4830/FER/Facial-Expression-Recognition/jaffe/test/fear');
an_dir=('/Users/chaolin/Documents/EE4830/FER/Facial-Expression-Recognition/jaffe/test/anger');
di_dir=('/Users/chaolin/Documents/EE4830/FER/Facial-Expression-Recognition/jaffe/test/disgust');

ha_testSet = imageSet(ha_dir,'recursive');
sa_testSet = imageSet(sa_dir,'recursive');
su_testSet = imageSet(su_dir,'recursive');
fe_testSet = imageSet(fe_dir,'recursive');
an_testSet = imageSet(an_dir,'recursive');
di_testSet = imageSet(di_dir,'recursive');

success = 0;
total = ha_testSet.Count + sa_testSet.Count + su_testSet.Count + ...
    + fe_testSet.Count + an_testSet.Count + di_testSet.Count;

s_ha = evaluate(ha_testSet, "happy");
happy = s_ha / ha_testSet.Count
s_sa = evaluate(sa_testSet, "sad");
sad = s_sa / sa_testSet.Count
s_su = evaluate(su_testSet, "surprise");
suprise = s_su / su_testSet.Count
s_fe = evaluate(fe_testSet, "fear");
fear = s_fe / fe_testSet.Count
s_an = evaluate(an_testSet, "anger");
anger = s_an / an_testSet.Count
s_di = evaluate(di_testSet, "disgust");
disgust = s_di / di_testSet.Count

success = s_ha + s_sa + s_su + s_fe + s_an + s_di;
display("accuracy: ");
display(success/total);


