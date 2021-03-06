layers = [
    imageInputLayer([525 700 3])  
    convolution2dLayer(3,16,'Padding',1)
    batchNormalizationLayer
    reluLayer    
    maxPooling2dLayer(2,'Stride',2) 
    convolution2dLayer(3,32,'Padding',1)
   batchNormalizationLayer
    reluLayer 
    fullyConnectedLayer(4)
    softmaxLayer
    classificationLayer];
%opts = trainingOptions('sgdm');
opts = trainingOptions('sgdm',...
       'InitialLearnRate',0.001,...
       'LearnRateSchedule', 'piecewise',...
       'LearnRateDropFactor',0.1,...
       'LearnRateDropPeriod',8,...
       'L2Regularization',0.004,...
       'MaxEpochs',10,...
       'MiniBatchSize',10,...
       'Verbose',true,...
       'Plots','training-progress');

[trainedNet,traininfo]= trainNetwork(trainData,layers,opts);

YPred=classify(trainedNet,testData,'ExecutionEnvironment','cpu')
YTest = testData.Labels;
accuracy = sum(YPred == YTest)/numel(YTest)