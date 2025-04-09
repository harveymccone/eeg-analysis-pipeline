# EEG Analysis Pipeline: ERP & Time-Frequency Analysis

This repository contains the complete analysis pipeline used in the published study:  

*"Signatures of time interval reproduction in the human electroencephalogram (EEG)"* – (Imaging Neuroscience (MIT Press), 2024) 

https://doi.org/10.1162/imag_a_00279

It includes preprocessing, statistical analysis, and visualisation of EEG data using MATLAB and Python. 

---

## Project Summary
- **Data Type**: High-dimensional time series EEG (128 channels) and behavioural data
- **Tools Used**: Python (e.g. NumPy, Pandas, SciPy, matplotlib seaborn, MNE), MATLAB
- **Goal**: Understand the relationship between ERP components, time-frequency power modulations, and human behaviour in a cognitive task.

---

## Pipeline Overview

### Preprocessing
- Artifact rejection, filtering, epoching
- CSD transformation (in MATLAB)
- Data conversion between MATLAB and Python
- Extraction of time-frequency data using Fourier Transform

### Analysis and Visualisation 
- Plotting average waveforms and topographies
- Statistical testing (e.g. ANOVA, LMMs)
  
---

## Folder Guide
- `/matlab` — Contains CSD transformation script
- `/python` — Full pipeline: preprocessing, analysis, plotting

---

## Publication
Statistical analysis and visualisation generated from this pipeline can be viewed in:  

**"Signatures of time interval reproduction in the human electroencephalogram (EEG)"**  *(Imaging Neuroscience (MIT Press), 2024)*  

https://doi.org/10.1162/imag_a_00279
