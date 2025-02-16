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


# Clone the repository
git clone https://github.com/fishaudio/fish-speech.git

cd fish-speech

# Install fish-speech
pip3 install -e .[stable]

# if you encounter an error with pyaudio, first install portaudio19-dev
# sudo apt-get install portaudio19-dev