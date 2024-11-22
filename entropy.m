function En = entropy(windowFFT, numOfShortBlocks)
% This function computes the spectral entropy of the given audio frame
% windowFFT        : the abs(FFT) of an audio frame (computed by getDFT() function)
% numOfShortBlocks : the number of bins in which the spectrum is divided

% number of DFT coefs
fftLength = length(windowFFT);

% total frame (spectral) energy
Eol = sum(windowFFT.^2);

% length of sub-frame:
subWinLength = floor(fftLength / numOfShortBlocks);
if length(windowFFT)~=subWinLength* numOfShortBlocks
    windowFFT = windowFFT(1:subWinLength* numOfShortBlocks);
end

% define sub-frames:
subWindows = reshape(windowFFT, subWinLength, numOfShortBlocks);

% compute spectral sub-energies:
s = (subWindows.^2) / (Eol+eps);

% compute spectral entropy:
En = -(s.*log2(s+eps));