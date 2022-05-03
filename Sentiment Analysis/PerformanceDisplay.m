
%coerce sentiment to 1/0 scale

sentimentScore(sentimentScore > 0) = 1;   %take >1 to be 1 only
sentimentScore(sentimentScore < 0)= -1;   %there is no neutral only negative

notfound = sum(sentimentScore == 0);
covered = numel(sentimentScore) - notfound;

%coerce data to match scales
tp = sentimentScore((sentimentScore > 0) & ( actualScore >0));
tn = sentimentScore((sentimentScore  < 0) &( actualScore == 0));

%coverage

fprintf("Coverage: %2.2f%%, found  %d, missed: %d\n", (covered * 100)/numel(sentimentScore), covered, notfound);

%Calculate accuracy
acc = (sum(tp) - sum(tn))/sum(covered);
fprintf("Accuracy: %2.2f%%, tp: %d, tn: %d\n", acc*100, sum(tp), -sum(tn));


%figure
confusionchart(actualScore, sentimentScore);
