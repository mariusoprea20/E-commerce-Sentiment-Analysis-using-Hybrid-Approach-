sentimentScore = zeros(size(sents));

for ii = 1 : sents.length
    docwords = sents(ii).Vocabulary;
    for jj = 1 : length(docwords)
        if words_hash.containsKey(docwords(jj))
            sentimentScore(ii) = sentimentScore(ii) +  words_hash.get(docwords(jj));
        end
    end
    if sentimentScore(ii) == 0
        vec = word2vec(emb,docwords);
        [~,scores] = predict(model,vec);
        sentimentScore(ii) = mean(scores(:,1));
        if isnan(sentimentScore(ii))
            sentimentScore(ii) = 0;
        end
    end
    if sentimentScore(ii) ~= 0
        fprintf('+++Sent: %d, words: %s, FoundScore: %d, GoldScore: %d\n', ii, joinWords(sents(ii)), sentimentScore(ii), actualScore(ii));
    else
        fprintf('---Sent: %d, words: %s, Not Covered, GoldScore: %d\n', ii, joinWords(sents(ii)),  actualScore(ii));
    end
end