# Phoneme to word (Phoneme2word)
### Description :
* Phoneme2word is a tool to convert phonemes sequences from forced alignment results into words
* We compare phonemes obtained from forced alignment results with an extensive lexicon list.
* This is matched to the transcription of the audio file for which we have forced alignment results.
* The final output is composed of words and the respective durations at which they occur.  
### Dependencies
* MATLAB (version >=7.0)
* Unix environment
* Transcript of the audio file
### Input Phoneme Sequence
```javascript
Start   End     Phone
0.00 	0.58	sil
0.58 	0.70	r
0.70 	1.20	ey
1.20 	1.30	n
1.30 	1.39	r
1.39 	1.82	ey
1.82 	1.96	n
1.96 	2.04	g
2.04 	2.24	ow
2.24 	2.27	sil
2.27 	2.62	ah
2.62 	2.73	w
2.73 	3.11	ey
3.11 	3.28	sil
```
### Output Word Sequence
```javascript
Start   End     Words
0.00	0.58	silence
0.58	1.30	rain
1.30	1.96	rain
1.96	2.24	go
2.24	2.27	silence
2.27	3.11	away
```
### Usage:
```javascript
% change the current directory to phoneme2word
% Run the demo file.
$ matlab -nodisplay
$ demo_phone2word
```
### Results
* **_Audio_** folder consist of the test audio 
* **_results_** folder consist of phone alignments 
* **_transcript_** folder consist of the transcripts corresponding to the audio files.
* **_Word_final_results_** consist of the resultant word boundary and the word

### Stuff used to make this:

 * [kaldi](https://github.com/kaldi-asr/kaldi) for creating forced alignment scripts
 * [fisher-english corpus](https://catalog.ldc.upenn.edu/ldc2004t19) the sample forced alignment results available in the results folder, have been created by running forced-alignment scripts in KALDI with models trained on fisher-english corpus. Any corpus can be used to train a model and run forced-alignment scripts.

