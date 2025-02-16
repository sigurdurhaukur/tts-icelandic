---
language:
- is
base_model:
- fishaudio/fish-speech-1.5
pipeline_tag: text-to-speech
---

# Icelandic TTS Model - Talrómur3

This repository hosts an Icelandic text-to-speech (TTS) model finetuned from [fish-speech](https://huggingface.co/fishaudio/fish-speech-1.5) using the [Talrómur3](https://repository.clarin.is/repository/xmlui/handle/20.500.12537/344) dataset. The model is designed to generate high-quality Icelandic speech.

## Model Details

- **Base Model:** fishaudio/fish-speech-1.5
- **Dataset:** Talrómur3 from Clarin-IS
- **Repository:** [https://github.com/sigurdurhaukur/tts-icelandic](https://github.com/sigurdurhaukur/tts-icelandic)

## Installation

To use this model, install the required dependencies:

```bash
# Create a python 3.10 virtual environment, you can also use virtualenv
conda create -n fish-speech python=3.10
conda activate fish-speech

# Install pytorch
pip3 install torch==2.4.1 torchvision==0.19.1 torchaudio==2.4.1

# (Ubuntu / Debian User) Install sox + ffmpeg
apt install libsox-dev ffmpeg 

# (Ubuntu / Debian User) Install pyaudio 
apt install build-essential \
    cmake \
    libasound-dev \
    portaudio19-dev \
    libportaudio2 \
    libportaudiocpp0

# Install fish-speech
pip3 install -e .[stable]
```

Download the model

```
huggingface-cli download Sigurdur/fish-speech-1.5-icelandic --local-dir checkpoints/fish-speech-1.5
```

Download the fish-speech repo and follow the instructions from here [https://speech.fish.audio/inference/](https://speech.fish.audio/inference/)

## Data

The model was trained on 0.45 hours of speaker ``F01`` with the ``happy`` emotion.

```
 @misc{20.500.12537/344,
   title = {Talr{\'o}mur 3 v0.1 (24.09)},
   author = {{\"O}rn{\'o}lfsson, Gunnar Thor and Sigurgeirsson, Atli {\TH}{\'o}r and Nikul{\'a}sd{\'o}ttir, Anna Bj{\"o}rk and Schnell, Daniel},
   url = {http://hdl.handle.net/20.500.12537/344},
   note = {{CLARIN}-{IS}},
   copyright = {Creative Commons - Attribution 4.0 International ({CC} {BY} 4.0)},
   year = {2024}
}
```

## Model Performance

The model performs horribly on Icelandic, and has lost all previous language skills. The model is probably over-fitting.

### Examples

#### Example 1

**Text:** "einn, tveir, þrír, fjórir, fimm, dimmalimm."

<audio controls>
    <source src="https://huggingface.co/Sigurdur/fish-speech-icelandic/resolve/main/audio(1).wav" type="audio/wav">
    Your browser does not support the audio element.
</audio>

Example 2

**Text:** "Góðan daginn, ég heiti Anna."

<audio controls>
    <source src="https://huggingface.co/Sigurdur/fish-speech-icelandic/resolve/main/audio.wav" type="audio/wav">
    Your browser does not support the audio element.
</audio>

## Acknowledgments

Special thanks to Clarin-IS for providing the Talrómur3 dataset.

## Contact

For any questions, please reach out via LinkedIn: [Sigurður Haukur Birgisson](https://www.linkedin.com/in/sigurdur-haukur-birgisson/)
