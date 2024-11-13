# Mammogram Pectoral Muscle Removal Using Fuzzy C-Means ROI Clustering Multi Classification

This repository contains the implementation for a mammogram classification model that aids in breast cancer detection by classifying mammograms as normal, malignant, or benign. The model uses an enthalpy-based fuzzy c-means ROI clustering approach for pectoral muscle removal, followed by a Median Support Value-Based Convolutional Neural Network (MS-CNN) for accurate classification of mammogram abnormalities.

## Table of Contents

- [Introduction](#introduction)
- [Methodology](#methodology)
- [Results](#results)
- [Datasets](#datasets)
- [Installation](#installation)
- [Usage](#usage)
- [License](#license)

## Introduction

Breast cancer is a major cause of mortality among women, and early detection is crucial. This project proposes a method that:
1. Uses fuzzy c-means clustering to isolate the pectoral muscle, which can interfere with accurate cancer detection.
2. Classifies breast lesions using an Median Support Value-Based Convolution Neural Network  (MSV-CNN) classifier, identifying four abnormality types: microcalcifications, masses, architectural distortions, and bilateral asymmetry.

## Methodology

### Steps
1. **Image Pre-processing**: Images are pre-processed using fuzzy filtering for noise reduction and histogram equalization.
2. **ROI Clustering**: Enthalpy-based fuzzy c-means clustering is applied to remove the pectoral muscle.
3. **Feature Extraction**: Extracted features include:
   - **Discrete Cosine Transform (DCT)**
   - **Discrete Wavelet Transform (DWT)**
   - **Gabor Filters**
   - **Multifractal and Morphological Analysis**
4. **Classification**: An MSV-CNN classifier, optimized for high classification accuracy, is employed to categorize the mammogram images.

### Key Contributions
- **Improved Noise Reduction**: Fuzzy filtering enhances image quality.
- **Accurate Pectoral Muscle Removal**: ROI clustering using fuzzy c-means accurately segments the relevant tissue.
- **Robust Feature Set**: A comprehensive feature extraction approach aids in accurate classification.

## Results

The method was evaluated using the MIAS, DDSM, and Lakeshore datasets, achieving impressive accuracy:
- **MIAS Dataset**: 99.37% accuracy
- **DDSM Dataset**: 99%
- **Lakeshore Dataset**: 99%
These results surpass traditional classifiers like CNN, ECNN, and SVM, especially in sensitivity, specificity, and overall accuracy.

## Datasets

The following datasets were used:
1. **MIAS Dataset**: Contains 322 digitized mammograms with truth-marked abnormalities.
2. **DDSM Dataset**: Comprises around 2,500 mammograms, with pixel-level ground truth data for suspicious regions.
3. **Lakeshore Dataset**: Consists of 100 mammograms, verified by radiologists.

## Usage

1. Pre-process the images using the fuzzy filtering and histogram equalization steps.
2. Apply the enthalpy-based fuzzy c-means ROI clustering.
3. Run the MSV-CNN classifier.
