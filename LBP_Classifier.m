%happy training
%train = imread('51.jpg');

%anger training
%train = imread('KA.AN1.39.tiff');

%happy
%train = imread('3.jpg');

%happy
train = imread('KA.HA2.30.tiff');

%happy
%test = imread('3.jpg');

%anger
%test = imread('44.jpg');

%anger
%test = imread('KA.AN1.39.tiff');

%happy
test = imread('KL.HA2.159.tiff');

figure, subplot(1,2,1);
imshow(train);
subplot(1,2,2);
imshow(test);

face = vision.CascadeObjectDetector('FrontalFaceLBP');
face.MergeThreshold = 3;

train_face_box = step(face, train);
train_face = imcrop(train, train_face_box);
train_face = imresize(train_face, [256,256]);
S = extractLBPFeatures(train_face);
%figure, bar(S);

test_face_box = step(face, test);
test_face = imcrop(test, test_face_box);
test_face = imresize(test_face, [256,256]);
M = extractLBPFeatures(test_face);
%figure, bar(M);

chi = 0;

for i = 1:59
    chi = chi + ((S(i) - M(i))^2)/(S(i)+M(i));
end

disp(chi)