filename = "yelp_labelled.txt"; 
%filename = "imdb_labelled_2.txt"; 
%filename = "amazon_cells_labelled.txt";
dataReviews = readtable(filename,'TextType','string');
textData = dataReviews.review; %get review text
actualScore = dataReviews.score; %get human reviewer's sentiment score
sents = processData(textData); 
fprintf('File: %s, Sentences: %d \n', filename, size(sents)); 
sentimentScore = zeros(size(sents));
for ii = 1 : sents.length
    docwords = sents(ii).Vocabulary;
    for jj = 1 : length(docwords)
        if words_hash.containsKey(docwords(jj))
            sentimentScore(ii) = sentimentScore(ii) +  words_hash.get(docwords(jj));
        end
    end
    fprintf('Sent: %d, words: %s, FoundScore: %d, GoldScore: %d\n', ii, joinWords(sents(ii)), sentimentScore(ii), actualScore(ii));
end