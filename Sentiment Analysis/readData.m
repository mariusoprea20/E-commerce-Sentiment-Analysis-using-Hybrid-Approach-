clc 
clear 
fidPositive=fopen(fullfile('opinion-lexicon-English','positive-words.txt')); 
fidNegative = fopen(fullfile('opinion-lexicon-English','negative-words.txt')); 
P= textscan(fidPositive,'%s','CommentStyle',';'); 
N = textscan(fidNegative,'%s','CommentStyle',';'); 
wordsPositive = string(P{1}); 
wordsNegative = string(N{1}); 
fclose all; 
words_hash = java.util.Hashtable; 
[possize, ~] = size(wordsPositive ); 
for ii = 1:possize
 words_hash.put(wordsPositive (ii,1),1); 
end
[possize, ~] = size(wordsNegative ); 
for ii = 1:possize
 words_hash.put(wordsNegative (ii,1),-1); 
end
