%Set aside 10% of the words at random for testing.

numWords = size(data,1);
cvp = cvpartition(numWords,'HoldOut',0.01); %holdout fewer if applying model
dataTrain = data(training(cvp),:);
dataTest = data(test(cvp),:);

%Convert the words in the training data to word vectors using word2vec.

wordsTrain = dataTrain.Word;
XTrain = word2vec(emb,wordsTrain);
YTrain = dataTrain.Label;

%Train a support vector machine (SVM) Sentiment Classifier which classifies word vectors into positive and negative categories.

model = fitcsvm(XTrain,YTrain);

% Test Trained Model 
wordsTest = dataTest.Word; 
XTest = word2vec(emb,wordsTest); 
YTest = dataTest.Label; 
%Predict the sentiment labels of the test word vectors. 
[YPred,scores] = predict(model,XTest); 
%Visualize the confusion matrix.
figure 
confusionchart(YTest,YPred); 
