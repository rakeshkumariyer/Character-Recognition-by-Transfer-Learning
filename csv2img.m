%47 Classes
% this file reads the emnist-balanced-train.csv file and creates the dataset folder as described in readme.md


classes = ['0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','a','b','d','e','f','g','h','n','q','r','t'];

m = csvread('emnist-balanced-train.csv');

for i=1:size(m,1)
    %m = csvread('emnist-balanced-train.csv',i,1,[i,1,i,784]);
    y = m(i,2:785);
    x = reshape(y,[28,28]);
    x = imresize(x,[227,227]);
    x = repmat(x,[1,1,3]);
    %csvread('emnist-balanced-train.csv',i,0,[i,0,i,0])
    label = classes(m(i,1)+1);
    if m(i,1)+1 <=36
        name = strcat('dataset\',label,'\',label,'(',string(i),')','.jpg');
        %this creates a folder by the name of the letter in upper case
    else
        name = strcat('dataset\small_',label,'\',label,'(',string(i),')','.jpg');
        %this creates a folder by the name "small_<lowercase-letter>" 
    end
    %if label=='0'
    %name is 1x1 matrix..... name{1} is the string
    imwrite(x,name{1},'jpg');
    
    
    
    %,colormap(hsv)
end
