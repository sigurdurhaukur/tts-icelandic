# create .lab files
import os
import csv
import argparse
from tqdm import tqdm

"""
python3 data_processing.py \
    --data_dir ./recordings \
    --speakers F01 F02 F03 F04 M01 M02 M03 M04 \
"""

# Parse command line arguments
parser = argparse.ArgumentParser(description="Generate .lab files from TSV files.")
parser.add_argument("--data_dir", type=str, required=True, help="Directory containing the TSV files.")
parser.add_argument("--speakers", nargs="+", type=str, required=True, help="List of speakers to process.")
args = parser.parse_args()

assert len(args.speakers) > 0, "No speakers provided."

# ensure speakers are valid
valid_speakers = os.listdir(args.data_dir)
for speaker in args.speakers:
    assert speaker in valid_speakers, f"Speaker {speaker} not found in {args.data_dir}. Available speakers: {valid_speakers}"

data_dir = args.data_dir
speakers = args.speakers

# Define speakers
for speaker in tqdm(speakers, desc="Processing speakers"):
    # Define the input TSV file and output directory
    tsv_file = f"./{data_dir}/{speaker}/index.tsv"  # Update this to your actual file path
    output_dir = f"./{data_dir}/{speaker}"  # Change if needed

    # Ensure output directory exists
    assert os.path.exists(output_dir), f"Output directory {output_dir} does not exist."
    assert os.path.exists(tsv_file), f"TSV file {tsv_file} does not exist."

    # Read the TSV file and create .lab files
    with open(tsv_file, "r", encoding="utf-8") as file:
        reader = csv.reader(file, delimiter="\t")
        for row in tqdm(reader, desc=f"Generating .lab files for speaker {speaker}"):
            if len(row) < 2:  # Skip invalid rows
                continue

            flac_filename = row[0]  # Extract the .flac filename
            flac_foldername = row[2]
            transcript = row[-1]  # Extract the transcript

            # Construct .lab filename
            lab_filename = os.path.splitext(flac_foldername + "/" + flac_filename)[0] + ".lab"
            lab_path = os.path.join(output_dir, lab_filename)

            # Write transcript to .lab file
            with open(lab_path, "w", encoding="utf-8") as lab_file:
                lab_file.write(transcript)
                