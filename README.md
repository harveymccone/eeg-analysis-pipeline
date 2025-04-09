# EEG Analysis Pipeline for ERP & Time-Frequency Analysis

This repository contains the complete analysis pipeline used in the published study:  

*"Signatures of time interval reproduction in the human electroencephalogram (EEG)"* – (Imaging Neuroscience (MIT Press), 2024) 

https://doi.org/10.1162/imag_a_00279

It includes preprocessing, statistical analysis, and visualisation of EEG data using MATLAB and Python. 

---

## Project Summary
- **Data Type**: High-dimensional time series EEG (128 channels) from human participants, alongside behavioural data
- **Tools Used**: Python (e.g. NumPy, Pandas, SciPy, matplotlib seaborn, MNE-Python), MATLAB
- **Goal**: Understand the relationship between ERP components, time-frequency power modulations, and human behaviour in a cognitive task.

---

## Pipeline Overview

This pipeline performs a series of modular steps for preprocessing, analysis, and visualization:

### 1. Preprocessing
- Artifact rejection, filtering, epoching
- CSD transformation (in MATLAB)
- Data conversion between MATLAB and Python
- Extraction of time-frequency data using Fourier Transform

### 2. Time-Frequency Analysis
- Extraction of time-frequency data using Fourier Transform

### 3. Statistical Analysis and Visualisation 
- Plotting average waveforms and topographies
- Statistical testing (e.g. ANOVA, Linear Mixed Models)
  
---

## Folder Guide
- `/matlab` — Contains CSD transformation script
- `/python` — — Contains the Python scripts for:
  - Preprocessing (`preprocessing.ipynb`)
  - Time-frequency analysis (`extract_time_frequency_data.ipynb`)
  - Statistical analysis and visualization (e.g., `plot_erps.py`, `analysis_erps.py`)

---

## Publication
Statistical analysis and visualisation generated from this pipeline can be viewed in:  

**"Signatures of time interval reproduction in the human electroencephalogram (EEG)"**  *(Imaging Neuroscience (MIT Press), 2024)*  

https://doi.org/10.1162/imag_a_00279
