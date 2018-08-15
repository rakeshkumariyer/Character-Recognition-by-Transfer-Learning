chards = imageDatastore('C:\Users\Pruthvi Raj\Desktop\zerone_cl\new_dataset','IncludeSubfolders',true,'LabelSource','foldernames');
%images = readall(chards);

chards.ReadSize = numpartitions(chards);
%chards.ReadFcn = @(loc)rgb2gray(imread(loc));
chards.ReadFcn = @(loc)imresize(imread(loc),[227,227]);
%chards.ReadFcn = @(loc)repmat(imread(loc),[1 1 3]);


charnames = chards.Labels;
[charTrain,charTest] = splitEachLabel(chards,0.8,'randomized');


anet = alexnet;
layers = anet.Layers;

fc = fullyConnectedLayer(47); %62 is the number of output classes
layers(end-2) = fc;
layers(end) = classificationLayer;
%opts = trainingOptions('sgdm');
%opts = trainingOptions('sgdm','InitialLearnRate',0.001);
opts = trainingOptions('sgdm',  'InitialLearnRate', 0.001, 'MiniBatchSize', 64,'MaxEpochs',30);
%[newnet,info] = trainNetwork(data,layers,options);
[newnet,info] = trainNetwork(charTrain,layers,opts);

preds = classify(newnet,charTest);
charActual = charTest.Labels;
plot(info.TrainingLoss);
numcorrect = nnz(preds == charActual);
fracCorect = numcorrect/size(preds,1)


