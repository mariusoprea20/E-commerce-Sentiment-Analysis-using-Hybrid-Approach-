rng('default') 
% load fastText toolbox 
emb = fastTextWordEmbedding;

% Create table of labeled words 
 words = [wordsPositive;wordsNegative]; 
labels = categorical(nan(numel(words),1)); 
labels(1:numel(wordsPositive)) = "Positive"; 
labels(numel(wordsPositive)+1:end) = "Negative"; 
data = table(words,labels,'VariableNames',{'Word','Label'});

% Remove all words that are in data (Bing Liu) and not in fastText. 
 idx = ~isVocabularyWord(emb,data.Word); data(idx,:) = []; 