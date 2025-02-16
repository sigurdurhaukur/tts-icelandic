# Talrómur 3

Talrómur 3 is a public domain speech corpus for Text-To-Speech (TTS) research and development in the domain of emotional speech synthesis. The corpus consists of 15,066 audio clips of ten different speakers reading sentences. The audio was recorded in 2024 by Reykjavík University and Grammatek as part of The Icelandic Language Technology Program. Each speaker read a script of 340 utterances in 6 different styles (neutral, happy, sad, angry, surprised and helpful), in a range of intensities, as well as 57 single-word utterances read both in isolation and in enumeration.

The audio is recorded at 48 kHz sample rate and 24 bit depth. Each audio file is stored in .flac format.
In addition to the audio recordings, this corpus includes Voice Activity Detection (VAD) values for each utterance, obtained using [Silero VAD](https://github.com/snakers4/silero-vad), as well as Montreal Forced Aligner (MFA) phoneme-level alignments.
These additional data can be used to trim the audio or during model training.
In this release we include:
recordings.zip - The raw audio recordings in .flac format.
vad.zip - The results of running Silero VAD on the dataset in JSON format.
alignments.zip - MFA alignments for each audio file in TextGrid format.
alignments_json.zip - MFA alignments for each audio file in JSON format.
README.md - This document, which describes the corpus.
LESIST.md - A description of the corpus in Icelandic.

## Design
The dataset consists of recordings of 340 utterances, recorded in 6 different emotive styles, in addition to 57 short utterances consisting of numbers, digits and letters recorded in 2 different styles: isolation and enumeration.
The emotional categories recorded in this dataset match categories from previous work in the field e.g. the [Emotional Speech Database](https://www.sciencedirect.com/science/article/pii/S0167639321001308): Neutral, Happy, Angry, Sad and Surprised. In addition to these emotions we included a “Helpful” category which, although not strictly speaking an ‘emotion’ has clear use cases in virtual assistants and customer support.

In addition to emotional categorical labels, we also instructed participants to vary the intensities of all non-neutral categories. Voice talents were instructed to read individual prompts according to an accompanying intensity value. The intensity values are presented as values on a 5-point scale, where 1 indicates very low intensity and 5 indicates very high intensity. Intensity values were randomized for each participant, but duplicated across categories. In order to obtain sufficient levels of moderate intensity samples, we used a Gaussian distribution for the values, which resulted in about half the total samples being 3: moderate intensity, and less than 20% combined being either 1: very low intensity or 5: very high intensity.
The additional 57 short utterances were recorded both as spoken in isolation (addendum), and in enumeration (addendum_style2).
A large proportion of the prompts are sourced from speech and interview transcripts, as well as posts on message boards. These prompts’ tone and grammar better reflect natural speech behavior when compared to many other TTS corpora which use prompts found in large, text-only datasets. A subset of the list of prompts was dedicated to each emotion, containing prompts subjectively matching the target emotion.

Speaker M03 recorded a script of 338 utterances, rather than 340, for non-neutral categories, resulting in 2,144 utterances for that voice instead of 2,154. The utterances skipped are IDs 262 ("Það gerðum við, ekki með því að loka heldur að ræða við fólk.") and 325 ("Nei en ég hef trú á því að það hérna sé verið að skoða þetta af alvöru núna."). The same utterances, 262 and 325, are also skipped for speaker M01 in the neutral style, resulting in a total of 2,152 utterances for that voice.

## Format
The corpus consists of 7 voice directories, each containing 8 subdirectories and an index.tsv file.
Each subdirectory denotes a subsection of the corpus. The subsections (neutral, happy, sad, angry, surprised, helpful) contain 340 utterances each, and the subsections (addendum, addendum_style2) contain 57 very short utterances each: numbers from 0 to 20 and all letters of the Icelandic alphabet in addition to (c, w, z).

The index.tsv has 5 tab-separated columns:
1. audio filename
2. Speaker ID / voice directory name
3. Emotion label / subdirectory name
4. Emotion intensity
5. Prompt text


| Voice |Gender| Total duration | Speech duration | Mean f0 |
|------:|:----:|:--------------:|:---------------:|:-------:|
|   F01 |  F   |    02:45:22    |     02:12:49    |  278 Hz |
|   F02 |  F   |    02:22:31    |     01:57:11    |  257 Hz |
|   F03 |  F   |    02:29:53    |     02:00:57    |  275 Hz |
|   F04 |  F   |    02:37:05    |     02:05:08    |  278 Hz |
|   M01 |  M   |    02:33:57    |     01:58:08    |  183 Hz |
|   M02 |  M   |    02:22:39    |     01:51:03    |  177 Hz |
|   M03 |  M   |    02:25:48    |     01:48:36    |  134 Hz |

## Talent recruitment
To attract suitable participants, we advertised the project in online groups for singers and actors. The application process involved recording 5 unique utterances in 5 emotional styles each, using an online recording platform. We received a total of 97 applications.
We employed a 2-stage review process::
In the first stage, four expert reviewers separately evaluated each application on a 5-point Likert scale, basing their rating on voice quality, enunciation, likeability and emotional expression.
In the second stage, the top 10 male and top 10 female voices from the first stage were reviewed more thoroughly, and were ranked by the same reviewers using Borda ranked choice voting. We then contacted the top 5 male and top 5 female applicants from the second stage. Two applicants chose not to participate, so applicants further down the queue were selected.

## Recording setup
For our recordings we used a soundproofed studio located on RU’s campus. The microphone consisted of an AKG C480B preamplifier with a CK 61-ULS cardioid condenser capsule. The microphone was located in a shock mount and had a pop filter attached to minimize noise. A Presonus Clarett 2pre audio interface with built-in pre-amplification was used to digitize the audio. The raw audio is 48 kHz mono audio with 24 bit depth.
We used a modified version of a [minimal speech prompting and recording software suite](https://github.com/grammatek/speechrecorder) to prompt speakers and manage recordings.

## Post-processing
To conserve space, we converted the raw .wav files to .flac, but no other digital audio processing was performed. This means that audio levels may vary considerably between recordings, even intra-speaker. We recommend applying some sort of loudness normalization to the audio before using it to train models, e.g. [EBU R128](https://tech.ebu.ch/docs/r/r128.pdf). Since such processing is inherently lossy, we leave it to the user to apply it.
We used [Silero-VAD](https://github.com/snakers4/silero-vad) to label speech activity in the recordings in order to remove leading and trailing silences from each sample. We finally phoneme-level aligned the dataset using the Montreal Forced Aligner (MFA). The resulting alignment data is published alongside the processed audio.

It is important to note that this dataset exhibits a higher degree of discrepancy between the spoken phonemes and phonemic transcriptions compared to previous datasets. This is primarily due to our focus on achieving greater naturalness in speech, particularly in conveying emotions convincingly. As a result, phoneme-level transcripts and resulting alignments produced by the Montreal Forced Aligner (MFA) may not be 100% accurate.
This discrepancy is present across all intensity levels, though it may be more pronounced in highly emotional recordings. Unlike previous datasets that aimed for a more controlled 'radio speaker' style, our current dataset embraces natural speech patterns, including significant phonetic reductions and variations.
We observed that MFA occasionally struggles with certain phonemes, such as labiodental fricatives, sometimes mislabeling them as silences.
Given these considerations, we advise users to approach the MFA alignments with caution and to be aware of potential inaccuracies, especially when dealing with emotionally charged or particularly naturalistic speech segments.
The post-processing pipeline has been thoroughly documented, and all associated scripts have been uploaded to a [GitHub repository](https://github.com/icelandic-lt/emospeech-scripts).

## Current and subsequent release
This is version 0.1 of the corpus, containing 7 of the intended 10 voices; 4 female and 3 male. Recordings are still in progress for the final 3 voices and version 1.0 will include them in addition to the 7 already completed, for a total of 21,530 utterances (9*2,154 + 2,146).