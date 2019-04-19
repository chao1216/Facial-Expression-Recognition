function v = decompose_LBP(f);
%{ 
1. split input face image into upper and lower
2. extract bidirectional LBP feature vector of both upper and lower 
3. concatenate all LBP feature vectors
%}

% M = N = 180
[M,N] = size(f);
upper_face = imcrop(f, [0 0 180 90]);
lower_face = imcrop(f, [0 90 180 90]);

[upper1, u1] = LBP_clkwise(upper_face);
[upper2, u2]= LBP_counter_clkwise(upper_face);

[lower1, l1] = LBP_clkwise(lower_face);
[lower2, l2] = LBP_counter_clkwise(lower_face);

figure, subplot(2,2,1)
imshow(upper1);
subplot(2,2,2)
imshow(upper2);
subplot(2,2,3)
imshow(lower1);
subplot(2,2,4)
imshow(lower2);


v = [u1 u2 l1 l2];
