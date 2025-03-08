#!/bin/bash
#SBATCH --job-name=CDS_extraction             # Job name for Slurm
#SBATCH --output=/home/barrientosm/scratch/CDS_sequences/log_%j_%x_out.txt   # Log file for standard output (job ID and name included)
#SBATCH --error=/home/barrientosm/scratch/CDS_sequences/log_%j_%x_err.txt    # Log file for standard error (job ID and name included)
#SBATCH --nodes=1                            # Number of nodes to use
#SBATCH --ntasks-per-node=1                  # Number of tasks per node
#SBATCH --mem=6G                             # Memory allocation per job
#SBATCH --time=1:00:00                       # Time limit for the job
#SBATCH --partition=agap_long                # Specify the job queue/partition

# -------------------------------------------------------------------------------
# README - Extraction of CDS Sequences  
# -------------------------------------------------------------------------------
# Description:  
# This script extracts **CDS sequences** from a GFF file and a reference genome.  
# CDS = Coding sequences (protein-coding regions of genes)

# -------------------------------------------------------------------------------
# Step 1: Load required modules
# -------------------------------------------------------------------------------
module load bioinfo-cirad                     # Load the bioinformatics module
module load AGAT/1.2.0-singularity            # Load the AGAT tool module (version 1.2.0)

# -------------------------------------------------------------------------------
# Step 2: Define file paths
# -------------------------------------------------------------------------------

# Path to the directory containing GFF files
gff_path="/home/barrientosm/scratch/angsd_analysis/speltoides/samtool_GL/tajima_no_soft_clipped_reads"

# Specific GFF file to use (T. urartu annotation)
gff_file="$gff_path/YANG_2023_Y2032.updata.gff3"

# Path to the directory containing FASTA genome files
Genome_path="/home/barrientosm/projects/GE2POP/REFERENCES/TRITICUM/URARTU_ORIGINAL"

# Reference genome FASTA file
Genome="$Genome_path/Y2032.updata.genome.fa"

# Output directory
output_dir="/home/barrientosm/scratch/CDS_sequences/speltoides"

# -------------------------------------------------------------------------------
# Step 3: Extract CDS sequences with AGAT
# -------------------------------------------------------------------------------
# The AGAT command extracts **CDS sequences** (coding regions only).
# Flags:
#   -g: Path to the GFF file.
#   -f: Path to the genome FASTA file.
#   -t: Feature type (CDS in this case).
#   -o: Output file for extracted sequences.

agat_sp_extract_sequences.pl \
    -g $gff_file \
    -f $Genome \
    -t CDS \
    -o $output_dir/speltoides_full_CDS.fasta

# -------------------------------------------------------------------------------
# Output:
# The extracted CDS sequences are saved in the file:
# "$output_dir/speltoides_full_CDS.fasta".
# -------------------------------------------------------------------------------
