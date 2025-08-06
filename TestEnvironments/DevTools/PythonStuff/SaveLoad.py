# ============================================================================================
# This code is meant to help with developing the custom byte formats for saves. Specifically,
# the .dmn format for demons, .cgf for settings, and .sav for player data
# ============================================================================================

import sys
from io import BytesIO

#below is the format for the header. Organization of data is based on this.
"""
magic numbers: DEMON
game version: (4 bytes)
demon ID location: (2 bytes)
demon name location: (2 bytes)
demon name size: (1 byte)

demon St location: (2 bytes)
demon Ma location: (2 bytes)
demon En location: (2 bytes)
demon Ag location: (2 bytes)
demon Lu location: (2 bytes)
demon Lv location: (2 bytes)
demon HP location: (2 bytes)
demon SP location: (2 bytes)
demon Exp location: (2 bytes)

demon bonus stat exist: (1 byte, single bit for each stat)
demon bSt location: (2 bytes) (only if exist bit is true)
demon bMa location: (2 bytes) (only if exist bit is true)
demon bEn location: (2 bytes) (only if exist bit is true)
demon bAg location: (2 bytes) (only if exist bit is true)
demon bLu location: (2 bytes) (only if exist bit is true)
demon bMHP location: (2 bytes) (only if exist bit is true)
demon bMSP location: (2 bytes) (only if exist bit is true)

demon movepool location: (2 bytes)
demon movepool size: (1 byte)
demon trait location: (2 bytes)
demon item location: (2 bytes)
"""

test_data = {   "Version":[0,0,0,1],
                "ID":1, #1 = Arsene
                "Name": "pookie",
                "Arcana":0, #0 = Fool
                "Level":1,
                "Exp": 0,
                "Skills": [151, 2], #151 = Eiha, 2 = Cleave
                "Trait":82, #82 = Pinch Anchor
                "Stats": {  "St":2,
                            "Ma":2,
                            "En":2,
                            "Ag":3,
                            "Lu":1,
                            "MHP":75,
                            "MSP":30},
                "bStats": { "bSt":0, #each bonus stat is 2 bytes since not necessarily capped at 99
                            "bMa":0,
                            "bEn":0,
                            "bAg":0,
                            "bLu":0,
                            "bMHP":0,
                            "bMSP":0}}

defaults = {    "id_loc": 40,
                "name_loc": 42,
                "name_size": 0,
                "st_loc":42, #since name size is 0 by default, the next byte technically has the same location
                "ma_loc":43, #max 99, so stats only take up 1 byte
                "en_loc":44,
                "ag_loc":45,
                "lu_loc":46,
                "mhp_loc":47, #not capped at 99, so back to 2 bytes
                "msp_loc":49,
                "mvp_loc":51,
                "mvp_size":1,
                "trait_loc":53,
                "item_loc":55

}

def WriteDmn(data):
    offset = 0 #number of bytes to offset data by

    magic_numbers = 'DEMON'.encode('utf-8')

    output_buffer = BytesIO()

    #magic numbers
    output_buffer.write(magic_numbers)

    #game version
    for val in data["Version"]:
        output_buffer.write(val.to_bytes(1))

    #ID location
    output_buffer.write(defaults["id_loc"].to_bytes(2, byteorder='big'))

    #name location and size
    output_buffer.write(defaults["name_loc"].to_bytes(2, byteorder='big'))
    output_buffer.write(len(data["Name"]).to_bytes(1, byteorder='big'))
    offset += len(data["Name"])

    print(offset)

    #check if bonus stats exist
    bstat_exist = 0
    if not all(value == 0 for value in data["bStats"].values()):
        place = 7
        for value in data["bStats"].values():
            if value != 0:
                bstat_exist += 2^place
                offset += 2
            place -= 1
        


    with open("test.dmn", "wb") as binary_file:
        binary_file.write(output_buffer.getvalue())

def main():
    WriteDmn(test_data)

if __name__ == "__main__":
    sys.exit(main())