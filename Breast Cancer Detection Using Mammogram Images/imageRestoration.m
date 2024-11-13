function [out_Wiener] = imageRestoration(in_img,H)
% imageRestoration function: generating deblurred image out_Wiener given the degradation filter

if size(in_img,3)~=1
    %convert the image to grayscale to work properly
    in_img = rgb2gray(in_img);
    % show the grayscale version of the image
    figure;
    imshow(in_img);
    title('Original Image (Grayscale)');
end

% frequencey domain
G = fftshift(fft2(in_img));

% Wiener Filter
SNR = 20;
F3 = G.*H./(H.^2+(1/SNR));
F3 = ifftshift(F3);
out_Wiener = uint8(abs(ifft2(F3)));
end