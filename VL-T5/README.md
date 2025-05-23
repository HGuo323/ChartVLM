# VL-T5 Fine-tuning on ChartQA

This repository is adapted from [VL-T5](https://github.com/vis-nlp/ChartQA/tree/main/Models/VL-T5), customized for easier fine-tuning and evaluation on the ChartQA dataset.

## Overview
We fine-tune the VL-T5 model using pre-extracted visual features generated by a pretrained Mask R-CNN model.  
All training and evaluation steps have been integrated into a single Jupyter Notebook for simplicity and reproducibility.

## Setup

### 1. Prepare Your Dataset
Organize your data directory as follows:

```
├── data                   
│   ├── train   
│   │   ├── data.csv
│   │   ├── features
│   │   │   ├── chart1_name.json
│   │   │   ├── chart2_name.json
│   │   │   ├── ...
│   └── validation  
│   │   ├── data.csv
│   │   ├── features
│   │   │   ├── chart1_name.json
│   │   │   ├── chart2_name.json
│   │   │   ├── ...
```
 <strong>Note:</strong> The features json files names should match the "Image Index" column values in the data.csv file. 


### 2. Pretrained Checkpoints
Download the pretrained VL-T5 checkpoint from:  
[VL-T5 Checkpoint](https://drive.google.com/drive/folders/12Acv2YLQSxgrx_-4mahUvqNikcz7XfPi)

### 3. Visual Features
We use visual features extracted by the fine-tuned Mask R-CNN model provided here:  
[Chart-Mask-RCNN](https://huggingface.co/ahmed-masry/Chart-Mask-RCNN).

All extracted feature files (`.json`) for training, validation, and testing sets have been packed into a `.zip` file and uploaded to [Google Drive](https://drive.google.com/file/d/1tbTAvXINqjpxk_h_BLOWGURqSedR8IIg/view?usp=sharing).  
You can simply download and unzip it following the structure shown above.

There is no need to train or run Mask R-CNN yourself unless you wish to re-generate features.


## Fine-tuning

- All training steps are performed inside a provided Jupyter Notebook.
- Update the following paths inside the notebook:
  - `src_folder`: the path to your data directory.
  - `load`: the path to the pretrained VL-T5 model.
  - `output`: your desired output directory.
- Modify hyperparameters such as:
  - Batch size
  - Learning rate
  - Number of epochs
  - Validation frequency

## Prediction

- Evaluation and inference are also included in the notebook.
- Predicted results are saved for later evaluation or external scoring.

## Notes

- The evaluation metric used during training is **exact match accuracy**.
- **Exact match** is stricter than the **relaxed accuracy** reported in the original VL-T5 paper.

---
