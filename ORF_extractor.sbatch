#!/bin/bash
#SBATCH --job-name=ORF_extraction             # Job name for Slurm
#SBATCH --output=/home/barrientosm/scratch/CDS_sequences/log_%j_%x_out.txt   # Log file for standard output (job ID and name included)
#SBATCH --error=/home/barrientosm/scratch/CDS_sequences/log_%j_%x_err.txt    # Log file for standard error (job ID and name included)
#SBATCH --nodes=1                            # Number of nodes to use
#SBATCH --ntasks-per-node=1                  # Number of tasks per node
#SBATCH --mem=6G                             # Memory allocation per job
#SBATCH --time=1:00:00                       # Time limit for the job
#SBATCH --partition=agap_normal               # Specify the job queue/partition


ORF_tab_file="path/to/ORF_tab_file"
BAM_path_files="path/to/BAMS_files"

ORF_extractor.pl -orf $ORF_tab_file/ORF.tab \
                 -otype auto \
                 -seq $BAM_path_files/bam_list.txt \
                 -stype auto \
                 -out output

                 
# Option	Description
# -orf	Path to the ORF table file containing predicted ORFs (Open Reading Frames). This file lists the coordinates of the predicted ORFs.
# -otype auto Automatically chooses the most appropriate output format depending on the input file and ORF type.
# -seq Input FASTA file containing the nucleotide sequences (typically transcript sequences).
# -stype auto	Sequence type — auto automatically detects whether the input sequences are nucleotide or protein sequences.
# -out output	Prefix for the output files. The program will generate the extracted ORF sequences with this name.

#How the pipeline works:

   #  The script reads the FASTA file.
 #   It searches for ORFs defined in the ORF table.
 #   It extracts the corresponding ORF sequences.
 #   The auto options allow the program to automatically detect:
   #     The input sequence type.
     #   The best output format.
