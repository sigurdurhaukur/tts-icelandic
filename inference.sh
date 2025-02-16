python3 fish-speech/fish_speech/models/text2semantic/inference.py \
    --text "Halló, ég er að selja appelsínur. Má bjóða þér appelsínusafa?" \
    --prompt-text "Halló, halló. Þetta er einnhver að tala. Bara tala, tala, og segja mörg orð á svoldið glaðan máta." \
    --prompt-tokens "fake.npy" \
    --checkpoint-path "checkpoints/fish-speech-1.5" \
    --num-samples 2 \
    --compile