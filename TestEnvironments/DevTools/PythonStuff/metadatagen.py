# ============================================================================================
# This code is meant to generate and edit metadata files for PokeMT. It is only meant to be
# used by developers and will not be packaged into the actual game.
# ============================================================================================

import sys
import os
from enum import Enum
import pandas as pd
import traceback
import re

def ReplaceBetweenDelimiters(text, start_delim, end_delim, replacement_text):
    """
    This function replaces all the text, including the delimiters,
    between the specified start and end strings.

    :param text: text to edit
    :param start_delim: starting delimiter
    :param end_delim: ending delimiter
    :param replacement_text: text to insert

    :type text: str
    :type start_delim: str
    :type end_delim: str
    :type replacement_text: str

    :return: edited text
    :rtype: str
    """

    # Create a regex pattern to match everything between the start and end patterns.
    # re.DOTALL allows the '.' to match newline characters.
    # The '?' after '*' makes it non-greedy, matching the shortest possible sequence.
    pattern = re.compile(f"{re.escape(start_delim)}.*?{re.escape(end_delim)}", re.DOTALL)
    
    # Use re.sub to replace the matched section with the replacement_text.
    new_text = pattern.sub(replacement_text, text)
    return new_text

def GenerateReplacementString(header, data):
    """
    This function generates the replacement string based on the header and data given

    :param header: the first part of the first line
    :param data: the column of IDs to insert

    :type header: str
    :type data: dataframe column

    :return: string to insert
    :rtype: str
    """
    if "DEMONS" in header:
        enum = "Race."
    elif "SKILLS" in header:
        enum = "Skill."

    #create output string
    output = header + '\t' + enum + data[0] + ',\n'

    #iterate through all but the first and last item
    for i in range(len(data)-2):
        output = output + '\t\t\t\t\t\t\t\t' + enum + data[i+1] + ',\n'

    #append the last item and the footer
    output = output + '\t\t\t\t\t\t\t\t' + enum + data[len(data)-1] + ']\n#endregion'

    return output

def UpdateMetadata():
    """
    This function checks the csv files that contain skills, demons, traits, etc. and checks which ones
    are implemented, then logs that data in the metadata.gd 
    """

    #generate filepaths
    base_filepath = "./TestEnvironments/DevTools/PythonStuff"
    demon_fp = os.path.join(base_filepath, "Demons.csv")
    skill_fp = os.path.join(base_filepath, "Skills.csv")
    md_filepath = "./metadata.gd"

    #load csv data as dataframes
    demon_df = pd.read_csv(demon_fp)
    skill_df = pd.read_csv(skill_fp)
    
    #load metadata file
    gdscript_content = ""
    try:
        with open(md_filepath, "r") as f:
            gdscript_content = f.read()
    except FileNotFoundError:
        print("ERROR: The file does not exist")
    
    #create headers
    demon_header = '#region IMPLEMENTED DEMONS\nconst implemented_demons = ['
    skill_header = '#region IMPLEMENTED SKILLS\nconst implemented_skills = ['

    #create strings to insert
    demon_set = GenerateReplacementString(demon_header, demon_df['ID'])
    skill_set = GenerateReplacementString(skill_header, skill_df['id'])

    #replace 
    gdscript_content = ReplaceBetweenDelimiters(gdscript_content, '#region IMPLEMENTED DEMONS', '#endregion', demon_set)
    gdscript_content = ReplaceBetweenDelimiters(gdscript_content, '#region IMPLEMENTED SKILLS', '#endregion', skill_set)

    #write metadata file
    try:
        with open(md_filepath, "w") as f:
            f.write(gdscript_content)
    except FileNotFoundError:
        print("ERROR: The file does not exist")

def main():
    UpdateMetadata()
    
        


if __name__ == "__main__":
    sys.exit(main())