# Character-Recognition-by-Transfer-Learning
Transfer learning applied to AlexNet upon EMNIST dataset in Matlab

Download "emnist-balanced-train.csv" from https://www.kaggle.com/crawford/emnist#emnist-balanced-train.csv

After downloading the csv file , create a folder named "dataset" . Within this folder create subfolders each with the names of aplhabets in the classes array present in csv2img.m file . If the alphabet is uppercase , the subfolder name is the same but if it is lowercase then the subfolder name resembles "small_<lowercase-aplhabet>" . Remember to use the correct directory address of the dataset folder being created in the codes.

# csv2img.m

This file helps in creating dataset from the csv file downloaded . 

# classify.m

This file should be executed after creating the dataset . This file applies transfer learning and trains the modified network using the downloaded dataset . 

# Note : 
1) It would take a lot of time to train the neural network , so using powerful a GPU is recommended.
2) This network gave an accuracy close to 89%
