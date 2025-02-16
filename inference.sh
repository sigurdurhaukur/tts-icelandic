python3 fish-speech/fish_speech/models/text2semantic/inference.py \
    --text "Einu sinni var drengur að nafni Haukur sem elskaði að klifra í trjám og rannsaka dularfulla staði í skóginum nálægt heimili sínu. Dag einn, þegar hann var að klifra í gömlum eikartré, sá hann stóran svartan hrafn sem sat á grein og horfði á hann með glitrandi augum." \
    --prompt-text "Halló, halló. Þetta er einnhver að tala. Bara tala, tala, og segja mörg orð á svoldið glaðan máta." \
    --prompt-tokens "fake.npy" \
    --checkpoint-path "checkpoints/fish-speech-1.5-yth-lora2" \
    --num-samples 2 \
    --compile


python3 fish-speech/fish_speech/models/vqgan/inference.py \
    -i "temp/codes_0.npy" \
    --checkpoint-path "checkpoints/fish-speech-1.5/firefly-gan-vq-fsq-8x1024-21hz-generator.pth"
    