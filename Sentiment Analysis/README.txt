The following steps will enable you to develop a hybrid classifiers and polarise the sentiments within the dataset text tables.

1. Run readData.m - to read the data dictionary
2. Run LexiconClassifier.m - to create a lexicon-based classifier
3. Run WordEmbeddingClassifier.m - to invoke 1 mil of english words that will later be converted into word vectors for the SVM
4. Run SVMDeVo.m - to create the SVM classifier
5. Run  HybridClassifier.m  - to create the Hybrid Classifier by merging SVM with Lexicon-Based Classifier
6. Run PerformanceDisplay.m - to display the performance of the Hybrid Classifier


