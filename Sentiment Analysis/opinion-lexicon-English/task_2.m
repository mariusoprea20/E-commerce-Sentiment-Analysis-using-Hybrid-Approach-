filename = "yelp_labelled.txt"; 
%filename = "imdb_labelled_2.txt"; %filename = "amazon_cells_labelled.txt";
dataReviews = readtable(filename,'TextType','string');
textData = dataReviews.review; %get review text
actualScore = dataReviews.score; %get human reviewer's sentiment score
sents = preprocessReviews(textData); 
fprintf('File: %s, Sentences: %d \n', filename, size(sents)); 