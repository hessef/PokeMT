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
demon Lv location: (2 bytes)
demon Exp location: (2 bytes)

demon St location: (2 bytes)
demon Ma location: (2 bytes)
demon En location: (2 bytes)
demon Ag location: (2 bytes)
demon Lu location: (2 bytes)
demon HP location: (2 bytes)
demon SP location: (2 bytes)

demon bSt location: (2 bytes)
demon bMa location: (2 bytes)
demon bEn location: (2 bytes)
demon bAg location: (2 bytes)
demon bLu location: (2 bytes)
demon bMHP location: (2 bytes)
demon bMSP location: (2 bytes)

demon movepool location: (2 bytes)
demon movepool size: (1 byte)
demon trait location: (2 bytes)
demon item location: (2 bytes)
"""

test_data = {   "Version":[0,0,0,1],
                "ID":1, #1 = Arsene
                "Name": "pookie",
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
                "lv_loc":42, #since name size is 0 by default, the next byte technically has the same location
                "exp_loc":43, #4 bytes
                "st_loc":47, #max 99, so stats only take up 1 byte
                "ma_loc":48, 
                "en_loc":49,
                "ag_loc":50,
                "lu_loc":51,
                "mhp_loc":53, #not capped at 99, so back to 2 bytes
                "msp_loc":55,
                "bst_loc":57, #max 99, so stats only take up 1 byte
                "bma_loc":58, 
                "ben_loc":59,
                "bag_loc":60,
                "blu_loc":61,
                "bmhp_loc":62, #not capped at 99, so back to 2 bytes
                "bmsp_loc":64,
                "mvp_loc":66,
                "mvp_size":1,
                "trait_loc":68,
                "item_loc":70

}

def WriteDmn(data):
    offset = 0 #number of bytes to offset data by

    #region HEADER
    magic_numbers = 'DEMON'.encode('utf-8')

    output_buffer = BytesIO()

    #magic numbers
    output_buffer.write(magic_numbers)

    #game version
    for val in data["Version"]:
        output_buffer.write(val.to_bytes(1, byteorder='big'))

    #ID location
    output_buffer.write(defaults["id_loc"].to_bytes(2, byteorder='big'))

    #name location and size
    output_buffer.write(defaults["name_loc"].to_bytes(2, byteorder='big'))
    output_buffer.write(len(data["Name"]).to_bytes(1, byteorder='big'))
    offset += len(data["Name"])

    #level and exp locations
    output_buffer.write((defaults["lv_loc"]+offset).to_bytes(2, byteorder='big'))
    output_buffer.write((defaults["exp_loc"]+offset).to_bytes(2, byteorder='big'))

    #stat locations
    output_buffer.write((defaults["st_loc"]+offset).to_bytes(2, byteorder='big'))
    output_buffer.write((defaults["ma_loc"]+offset).to_bytes(2, byteorder='big'))
    output_buffer.write((defaults["en_loc"]+offset).to_bytes(2, byteorder='big'))
    output_buffer.write((defaults["ag_loc"]+offset).to_bytes(2, byteorder='big'))
    output_buffer.write((defaults["lu_loc"]+offset).to_bytes(2, byteorder='big'))
    output_buffer.write((defaults["mhp_loc"]+offset).to_bytes(2, byteorder='big'))
    output_buffer.write((defaults["msp_loc"]+offset).to_bytes(2, byteorder='big'))

    #write bonus stat locations
    output_buffer.write((defaults["bst_loc"]+offset).to_bytes(2, byteorder='big'))
    output_buffer.write((defaults["bma_loc"]+offset).to_bytes(2, byteorder='big'))
    output_buffer.write((defaults["ben_loc"]+offset).to_bytes(2, byteorder='big'))
    output_buffer.write((defaults["bag_loc"]+offset).to_bytes(2, byteorder='big'))
    output_buffer.write((defaults["blu_loc"]+offset).to_bytes(2, byteorder='big'))
    output_buffer.write((defaults["bmhp_loc"]+offset).to_bytes(2, byteorder='big'))
    output_buffer.write((defaults["bmsp_loc"]+offset).to_bytes(2, byteorder='big'))

    #write movepool location and size
    output_buffer.write((defaults["mvp_loc"]+offset).to_bytes(2, byteorder='big'))
    output_buffer.write((len(data["Skills"])).to_bytes(1, byteorder='big'))
    #increment offset for movepool size
    offset += (len(data["Skills"])*2)
    
    #write demon trait location
    output_buffer.write((defaults["trait_loc"]+offset).to_bytes(2, byteorder='big'))

    #write demon item location
    output_buffer.write((defaults["item_loc"]+offset).to_bytes(2, byteorder='big'))
    #endregion
    
    #region DATA
    #write ID
    output_buffer.write((data["ID"]).to_bytes(2, byteorder='big'))
    #write name
    output_buffer.write((data["Name"]).encode('utf-8'))
    #endregion

    with open("./TestEnvironments/DevTools/PythonStuff/SaveTest/test.dmn", "wb") as binary_file:
        binary_file.write(output_buffer.getvalue())

def LoadDmn():
    with open("./TestEnvironments/DevTools/PythonStuff/SaveTest/test.dmn", "rb") as binary_file:
        #check magic numbers
        mn = binary_file.read(5)
        if mn.decode('utf-8') != 'DEMON':
            return False
        
        #check version
        ver = ""
        for i in range(3):
            ver += (str(int.from_bytes(binary_file.read(1))) + ".")
        ver += str(int.from_bytes(binary_file.read(1)))
        print(ver)

def main():
    LoadDmn()

if __name__ == "__main__":
    sys.exit(main())