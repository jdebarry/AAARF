AAARF version 1.0.1.

Please Cite: http://www.biomedcentral.com/1471-2105/9/235

Software License: GNU Lesser Public License (http://www.gnu.org/copyleft/lesser.html)

Code Repository: https://github.com/jdebarry/AAARF

*****IMPORTANT: You can run this version of AAARF in a web browser from the CyVerse (formally iPlant) Discovery Environment. See cyverse.org to learn about CyVerse and run AAARF at https://de.cyverse.org*****

*****IMPORTANT***** AAARF is meant to work with small, random, sample sequence datasets.  AAARF cannot be used to analyze millions of reads from large NGS datasets.  It is not written to take advantage of parallel computing.  If you have large datasets, it is suggested that you randomly sample them and use a sample subset with AAARF.  For best results, it is suggested that you perform an All-by-All BLAST of your sample sequence and order the input fasta file from most to least repetitive prior to running AAARF.

Updates in version 1.0.1:
-There is no longer any need to alter the PERL script to run AAARF.
	-The input file path does not have to be entered into the script.
	-AAARF parameters are now entered at the command line.
-The required BLASTn database is created by AAARF at run time, removing the need for independent creation of the BLASTn database before running AAARF.
-AAARF parameters are printed to the top of the output log file at the start of each AAARF run, and in the command line terminal when each AAARF run completes.
-A usage error message has been updated to include available command line parameters.
-If a flag for a parameter is added at the command line without a value, the program will produce an error, but execute with the default for that parameter.

A) INTRODUCTION
This file contains information for the use of the Assisted Automated Assembler of Repeat Families (AAARF) Algorithm.  AAARF is designed to use random, unfiltered, genomic shotgun sequence data (both Sanger and 454 have been tested, but any random unfiltered reads should be suitable) to assemble builds representing families of repeats found in a target genome. 

B) PROJECT SUMMARY
Among the many features of an organism’s genome is a variably sized fraction composed of repeated sequences. These genomic repeats can be differentiated into sequences necessary for the proper form and function of the genome (such as centromeric and ribosomal sequences) and another class of repeats known as transposable elements (TEs). TEs are discreet entities that reside within a host genome. They are defined by their ability to mobilize and replicate within a host, thereby increasing their numbers. TEs have been found in virtually all well-studied organisms and are a major component of many eukaryotic genomes. 

The Assisted Automated Assembler of Repeat Families (AAARF) algorithm has been written as the software component of an overall plan to use a combination of sample sequencing, bioinformatics and novel software design approaches to characterize the high copy number repeats from genomes that have not been the focus of genome sequencing efforts.  The program is composed of a single Perl program that utilizes the freely available bioperl module libraries. After setting parameters, the user can utilize the program to assemble a set of "builds", representing distinct families of repeats found in the target genome. The builds are "walked out" in either direction from a random sample sequence that initiates a build.

*****IMPORTANT***** AAARF is meant to work with small, random, sample sequence datasets.  AAARF cannot be used to analyze millions of reads from large NGS datasets.  It is not written to take advantage of parallel computing capabilities.  If you have large datasets, it is suggested that you randomly sample them and use a sample subset with AAARF.  For best results, it is suggested that you perform an All-by-All BLAST of your sample sequence and order the input fasta file from most to least repetitive prior to running AAARF.

C) REQUIREMENTS AND INSTALLATION
You can run this version in the CyVerse (formally iPlant) Discovery Environment, from a web browser. See cyverse.org to learn about cyverse and run AAARF at https://de.cyverse.org

AAARF was developed using MAC OS X and has only been tested on this platform. 

You will  need the following programs and or packages:
    -Perl 5.8.1 or later (http://www.perl.org/)
    -Bioperl 1.2.3 or higher (http://www.bioperl.org/wiki/Main_Page)
    -Bioperl Run Package 1.4 or higher (http://www.bioperl.org/wiki/Run_package)
    -Log4perl 1.01 or higher (http://log4perl.sourceforge.net/)
    -NCBI BLAST 2.2.9 or higher (Altschul, S.F., Gish, W., Miller, W., Myers, E.W. & Lipman, D.J. (1990) "Basic local alignment search tool." J. Mol. Biol. 215:403-410)
    -Clustalw 1.8.3 or higher (Thompson, J.D., Higgins, D.G. and Gibson, T.J. (1994), CLUSTAL W: improving the sensitivity of progressive multiple sequence alignment through sequence weighting, position specific gap penalties and weight matrix choice, Nucleic Acids Research, submitted, June 1994.)

D) USING AAARF
	1) Input File
	    Fasta file of sample sequences that you are analyzing. Input sequences should be vector trimmed if appropriate.  There should be no empty sequences in the input fasta file. All input sequences should be at least 20 nts in size (20 is arbitrary here.  You just want the sequences to be larger than the BLAST wordsize). Also, sequences (except for fasta headers) should only contain nucleotide designations (actg).  Optional - for best results, it is suggested that you perform an All-by-All BLAST of your sample sequence and order the input fasta file from most to least repetitive prior to running AAARF.

*****IMPORTANT***** AAARF is meant to work with small, random, sample sequence datasets.  AAARF cannot be used to analyze millions of reads from large NGS datasets.  It is not written to take advantage of parallel computing capabilities.  If you have large datasets, it is suggested that you randomly sample them and use a sample subset with AAARF.  For best results, it is suggested that you perform an All-by-All BLAST of your sample sequence and order the input fasta file from most to least repetitive prior to running AAARF.

	2) Running AAARF and Setting Parameters from the command line
Usage: perl AAARF.pl --inputFile=ZU_1000.fasta

Add one or more of the following options paramaters:  --maxBlastHits=100 --minBlastMatch=150 --minBlastIdentity=0.89 --minBlastCoverDepth=2 --minBlastConsenLen=150 --BLAST_e=1e-25 --BL2SEQ_e=1e-10 --maxExtendHits=1000 --minExtendHits=1 --maxExtendLen=50 --minExtendLen=0 --minCoverLen=150 --minOverlapLen=90 --times_used=13

If no parameters are specified, the program defaults (shown in the example above) will be used.
        
Usage with parameters: perl AAARF.pl --inputFile=/path/to/inputfile |0 or more of the following options, otherwise defaults shown here will be used| --maxBlastHits=100 --minBlastMatch=150 --minBlastIdentity=0.89 --minBlastCoverDepth=2 --minBlastConsenLen=150 --BLAST_e=1e-25 --BL2SEQ_e=1e-10 --maxExtendHits=1000 --minExtendHits=1 --maxExtendLen=50 --minExtendLen=0 --minCoverLen=150 --minOverlapLen=90 --times_used=13		

    4) Output Files
    	inputFile_AAARF.fasta - main output file with assemblies of high-copy number repeats
        formatdb_log - log file generated when inputFile.fasta is formatted for BLAST searching
        inputFile.fasta.nhr - BLAST database file generated when inputFile.fasta is formatted for BLAST searching
        inputFile.fasta.nin - BLAST database file generated when inputFile.fasta is formatted for BLAST searching
        inputFile.fasta.nsq - BLAST database file generated when inputFile.fasta is formatted for BLAST searching
        AAARF_log - detailed log of all AAARF activities formatted based on log4Perl perl module
E) AAARF LOG
	
	1) The Log File
		The AAARF log is produced using the Perl logger Log4perl. The idea behind the production of this file is that you can examine AAARF's activities and use this information to optimize parameters or investigate your sequences further. Inspecting this file is not absolutely necessary for running AAARF and getting results (the build file). However, the log details all of AAARF's activities and how each sequence is evaluated and how the builds are made in a stepwise format.  
	    The log file contains program activities based on a user specified level of reporting. At the start of the log file the number of input sequences is reported. Information from individual attempted and successful builds in both directions (successful or not) are separated in the file by a line of asterices. The beginning of each line in the log file shows the level of reporting for that line (see below). THIS DOES NOT INDICATE ACTUAL ERRORS IN THE PROCESS. THIS IS SIMPLY THE LOG4PERL REPORTING LEVEL BEING USED. The log shows the sequences as they are considered, reports the steps of the evaluation and the decision reached for each build. 
		*NOTE* If you are planning to run multiple iterations of AAARF in the same directory be aware that information is appended to the log file with each iteration. This may lead to confusion if you are running a second iteration of the program, say with different parameters, open your log file and do not see the changes that you made. Clear or delete the log file before running a second iteration in the same directory. Alternatively, you can work in a new directory saving the information in the previous directory for comparison.
	
	2) Adjusting Reporting Level
	    Log4perl includes 5 reporting levels that can be adjusted to give increasing amounts of information about the AAARF process. The names of these reporting levels are a part of the Log4perl module and do not reflect actual errors or warnings for AAARF. Rather, they	reflect 5 hierarchical levels of information reporting. At each level the information reported at the previous level is also reported. The five levels are listed below along with the information that is available in a report at that level. The highest level "DEBUG" reports all available information. 

	DEBUG -- All available information. Adds BLAST2SEQ results, Clustalw alignments, various alerts and sequence concatenation information.
	INFO -- Adds lists of sequences that were used and the number of times that they are used during the process.
	WARN -- Adds the DNA sequence of the sequences used and constructed.
	ERROR -- Adds the evaluation of individual sequences and the coverage matrix information.
	FATAL -- At this level the AAARF_log file will contain only the most basic information. Shows major program steps.

	    The highest level, DEBUG, reports all available information. This is the default situation for AAARF. If you wish to have all of AAARF's activities reported in the log file just leave it as it is. However, if you wish restrict the amount of information reported to the logger you can alter the reporting level. To adjust the reporting level change the reporting call in the quotes at line 27 of AAARF.pl. Replace the word, DEBUG, with any of the reporting levels shown above. Make sure to leave the quotes themselves in place and just change the level.

			#-------------------------------------------------------+
			#LOGGER INITIATION AND VARIABLES FOR VARIOUS FUNCTIONS |
			#-------------------------------------------------------+	
			#Variable that stores the logger level
        	my $AAARF_Log_Level = 'DEBUG';
	

F) PARAMETERS

1) Changing Parameters
	
	AAARF offers complete control over all parameters affecting build construction. There are two set of parameters. One set governs BLAST and the 
	MCS construction. The other controls build extension. These parameters can be found under the headings of the same name at the start of the 
	program (AAARF.pl file). Example parameter sets shown below are in the same format as they appear in the program file AAARF.pl. To change the 
	value of any parameter simply change the numeric values associated with it. If the numeric value is in quotes, leave the quotes in place and change 
	the value between them. Parameter options are available on lines 59-85.

	In general it is best to consider the size and number of the sequences that you are using. Parameters that govern requirements for the size of 
	BLAST hits and produced sequences should be changed accordingly (minBlastMatch, minBlastConsenLen, minCoverLen, minOverlapLen). Sequence size also 		
	affects the step size (how far you extend in a single step) and the number of times that a sequence is allowed to be used in a single direction 
	(maxExtendLen and times_used). In general smaller step size can avoid "walking" into regions of a sample sequence that are not repetitive and can 
	halt the process. The number of times that a sequence is used should be adjusted accordingly, so that the maximum amount of information can be 
	obtained form each sequence used. 
	
	The parameters shown below were optimized for the datasets under investigation using the AAARG log file and multiple iterations of the program. 
	These parameters provide a good starting point for datasets using sequences of similar size.
	
	--AAARF default parameters (not recommended for all runs)
	--maxBlastHits = 100
	--minBlastMatch = 150
	--minBlastIdentity = 0.89
	--minBlastCoverDepth = 2
	--minBlastConsenLen = 150
	--BLAST_e = 1e-25
	--BL2SEQ_e = 1e-10
	--maxExtendHits = 1000
	--minExtendHits = 1
	--maxExtendLen = 50
	--minExtendLen = 0
	--minCoverLen = 150
	--minOverlapLen = 90
	--times_used = 13
	
	
		a) Parameter set for 1,000 Sanger Shotgun Sequences--Average Sequence Size 700bp

#-----------------------------------------------------------------------+
#PROGRAM PARAMETERS (MCS CONSTRUCTION---EXTENSION---MULTIPLE ALIGNMENT) |
#-----------------------------------------------------------------------+
#--------------------------------------+
#BLAST AND MCS CONSTRUCTION PARAMETERS |
#--------------------------------------+
my $maxBlastHits = 100;       # maximum number of hits used to construct coverage matrix
my $minBlastMatch = 150;      # minimum length for a BLAST hit
my $minBlastIdentity = 0.89;  # minimum identity for a BLAST hit
my $minBlastCoverDepth = 2;   # minimum coverage depth for MCS 
my $minBlastConsenLen = 150;  # minimum length for MCS
my $BLAST_e = '1e-25';        # maximum evalue for BLAST hit (replace value inside quotes to adjust)
my $BL2SEQ_e = '1e-10';       # maximum evalue for BL2SEQ hit (replace value inside quotes to adjust)

#---------------------+
#EXTENSION PARAMETERS |
#---------------------+
my $maxExtendHits = 1000;      # maximum number of BLAST hits used to extend build
my $minExtendHits = 1;         # minmum number of BLAST hits used to extend build, must be >= 1
my $maxExtendLen = 50;         # maximum extension length (step size)
my $minExtendLen = 0;          # minimum extension length (step size) 
my $minCoverLen = 150;         # Controls: 1) required size of overlap between MCS and NQ 
                               # 2) minimum coverage for extension (overlap between sample sequences 
                               # and MCS during NQ construction) 3) NQ must be at least this long
my $minOverlapLen = 90;        # minimum required overlap between MCS and New Query Sequence for BL2SEQ,
                               # based on 60% of minCoverLen
my $times_used = 13;           # Maximum number of times that a sequence is used in each direction


		b) Parameter set for 10,000 Sanger Shotgun Sequences--Average Sequence Size 700bp

#-----------------------------------------------------------------------+
#PROGRAM PARAMETERS (MCS CONSTRUCTION---EXTENSION---MULTIPLE ALIGNMENT) |
#-----------------------------------------------------------------------+
#--------------------------------------+
#BLAST AND MCS CONSTRUCTION PARAMETERS |
#--------------------------------------+
my $maxBlastHits = 100;       # maximum number of hits used to construct coverage matrix
my $minBlastMatch = 150;      # minimum length for a BLAST hit
my $minBlastIdentity = 0.89;  # minimum identity for a BLAST hit
my $minBlastCoverDepth = 3;   # minimum coverage depth for MCS 
my $minBlastConsenLen = 150;  # minimum length for MCS
my $BLAST_e = '1e-25';        # maximum evalue for BLAST hit (replace value inside quotes to adjust)
my $BL2SEQ_e = '1e-10';       # maximum evalue for BL2SEQ hit (replace value inside quotes to adjust)

#---------------------+
#EXTENSION PARAMETERS |
#---------------------+
my $maxExtendHits = 1000;      # maximum number of BLAST hits used to extend build
my $minExtendHits = 2;         # minmum number of BLAST hits used to extend build, must be >= 1
my $maxExtendLen = 50;         # maximum extension length (step size)
my $minExtendLen = 0;          # minimum extension length (step size) 
my $minCoverLen = 150;         # Controls: 1) required size of overlap between MCS and NQ 
                               # 2) minimum coverage for extension (overlap between sample sequences 
                               # and MCS during NQ construction) 3) NQ must be at least this long
my $minOverlapLen = 90;        # minimum required overlap between MCS and New Query Sequence for BL2SEQ,
                               # based on 60% of minCoverLen
my $times_used = 13;           # Maximum number of times that a sequence is used in each direction


		c) Parameter set for 50,419 454 Shotgun Sequences--Average Sequence Size 100bp

#-----------------------------------------------------------------------+
#PROGRAM PARAMETERS (MCS CONSTRUCTION---EXTENSION---MULTIPLE ALIGNMENT) |
#-----------------------------------------------------------------------+
#--------------------------------------+
#BLAST AND MCS CONSTRUCTION PARAMETERS |
#--------------------------------------+
my $maxBlastHits = 1000;       # maximum number of hits used to construct coverage matrix
my $minBlastMatch = 30;        # minimum length for a BLAST hit
my $minBlastIdentity = 0.88;   # minimum identity for a BLAST hit
my $minBlastCoverDepth = 3;    # minimum coverage depth for MCS 
my $minBlastConsenLen = 30;    # minimum length for MCS
my $BLAST_e = '1e-10';         # maximum evalue for BLAST hit (replace value inside quotes to adjust)
my $BL2SEQ_e = '10';           # maximum evalue for BL2SEQ hit (replace value inside quotes to adjust)

#---------------------+
#EXTENSION PARAMETERS |
#---------------------+
my $maxExtendHits = 1000;      # maximum number of BLAST hits used to extend build
my $minExtendHits = 2;         # minimum number of BLAST hits used to extend build, must be >= 1
my $maxExtendLen = 40;         # maximum extension length (step size)
my $minExtendLen = 0;          # minimum extension length (step size) 
my $minCoverLen = 30;          # Controls: 1) required size of overlap between MCS and NQ 
                               # 2) minimum coverage for extension (overlap between sample sequences 
                               # and MCS during NQ construction) 3) NQ must be at least this long
my $minOverlapLen = 15;        # minimum required overlap between MCS and New Query Sequence for BL2SEQ,
                               # based on 50% of minCoverLen 
my $times_used = 4;            # Maximum number of times that a sequence is used in each direction

	2) General Parameter Guidelines
	--Parameter alteration over multiple runs combined with examination of the AAARF_log file is the best way to optimize parameters for a dataset
	--The larger the input dataset the more likely it is to contain repeats present in lower copy numbers in the genome and the more likely it is to contain more copies of higher copy number repeats. This should be considered when setting parameters that decide how repetitive a sequence must be ($minBlastCoverDepth and $minExtendHits).
	--Parameters controlling BLAST identity and e value ($minBlastIdentity, $BLAST_e and $BL2SEQ_e) will affect what sequences are used in the program. In general $BL2SEQ_e will perform better at a lower value thatn $BLAST_e because the sequences are shorter at that step and therefore small sequence differences will affect the e value. This is especially true for 454 sequences because the MCS and NQ will be especially small (depending on average sequence size and required MCS and NQ size). Different values of $minBlastIdentity will affect output and should be considered for optimization of particular data sets. In general, lower values will allow more diverse repeats (from the same or related families) to come together.
	--$maxBlastHits and $maxExtendHits control the maximum number of BLAST hits used to construct the MCS and the New Query sequence respectively. Unless your data sets are very large these values can be set high to ensure that as many sequences as possible are used.
	--$minBlastMatch should be adjusted based on the size of the sample sequences and the step size. While it may seem logical to set the hit size and step size to use all of a sequence in once pass, remember that many sample sequences will contain low copy number sequence as well as repetitive sequence. The introduction of low copy number sequence into a multiple alignment designed to make the next query sequence could corrupt it and cause a build to stop prematurely. Therefore it is better to use smaller sections of the larger sequences.
	--$minBlastConsenLen should be based on sequence size. Usually it is best to set this to the same value as $minBlastMatch.
    --$minExtendHits can be changed based on the number of sequences you are using. If this variable is set at one and only one sequence is available to extend the build, there is no multiple alignment. The extending sequence is used as is.
	--$maxExtendLen can be changed based on the sequence size that you are using and the step size that you want. 
	--$minExtendLen can be changed based on how you want individual sequences to be evaluated. While a sequence may not contribute anything to extension (if you come to the end of it) it can still help construct a New Query Sequence. Alternatively you may require that all sequences used extend the build.
	--$minCoverLen can be changed according to the size of the sequences that you are using. Usually it is best to set this variable to the same value as $minBlastMatch and $minBlastConsenLen.
	--$minOverlapLen can be changed based on $minCoverLen. 
	--$times_used can be changed based on the size of the input sequences and the step size ($maxExtendLen).