# replace_soh_separator.py

from pathlib import Path
import logging

logger = logging.getLogger(__name__)

if __name__ == "__main__":

    """
    This script replaces the SOH control character (^A, \x01),
    which is often used in Hadoop for field seperator in CSV files, 
    with a semicolon (;)
    
    https://en.wikipedia.org/wiki/C0_and_C1_control_codes#SOH
    
    Note: one can also use sed replace: https://stackoverflow.com/questions/13180057/replacing-control-character-in-sed
    """
    #file_path=input("Enter Path:")
    #file_path=r""
    # Delimiter / seperator to convert to
    DELIMITER = ","

    # Control character (1st byte) delimiter to replace
    SOH = "\x01"  # aka ^A

    # Setup path reference to input/output file (edit to reference correct path)
    data_folder = Path("data")                               # set your reference directory
    file_input_path = data_folder / "input.csv"              # set your reference input file
    file_output_path = data_folder / "input_converted.csv"   # set your reference output file

    logger.info(f"Reading input file {file_input_path} to replace all occurrences of {SOH} with delimiter {DELIMITER}")

    # Open input file
    file_in = open(file_input_path, "rt")

    # Create a separate output file in order to write the converted result
    file_out = open(file_output_path, "wt")

    # Parse each line from input file, replace delimiter and write line to output file
    for line in file_in:
        file_out.write(line.replace(SOH, DELIMITER))


    # Finally, close both input and output files
    logger.info("Done, closing files...")
    file_in.close()
    file_out.close()
    
    logger.info(f"Output file is written to: {file_output_path}")