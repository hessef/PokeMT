# ============================================================================================
# this code is meant to update the sqlite databases for PokeMT and should only be used by devs
# ============================================================================================

import sqlite3 as sql
import sys
import os
from enum import Enum
import csv
import traceback

class db(Enum):
    DEMONS      = 0
    SKILLS      = 1
    TRAITS      = 2
    TEAMS       = 3
    ENCOUNTERS  = 4

class Debug(Enum):
    NONE        = 0
    INFO        = 1
    VERBOSE     = 2

demon_columns = ["ID","Name","Arcana","Level","Skill0","Skill1","Skill2","Skill3","Skill4","Skill5","Skill6","Skill7",
                 "Trait","St","Ma","En","Ag","Lu","HP","SP","Slash","Strike","Gun","Fire","Ice","Elec","Wind",
                 "Psy","Nuke","Bless","Curse","Inheritance","BAttack","LearnLvls","LvlUpSkills","Background",
                 "FakeName", "Mobility","Evolve"]

skill_columns = ["name","type","subtype","power","accuracy","hit_min","hit_max","aoe","cost",
                 "trigger_condition","skill_conditions","ailment","ailment_chance",
                 "crit_chance","status","effect","description","inherit","scaling","priority"]

def CreateOrConnectToDB(database):
    """
    This function connects to the desired database or creates it if needed

    :param database: desired database to connect to
    :type database: Enum db

    :return: connection to sqlite database
    :rtype: sqlite connection
    """

    #set which database to connect to
    match database:
        case  db.DEMONS:
            db_name = "demon_stats.db"
        
        case db.SKILLS:
            db_name = "skill_data.db"
        
        case db.TRAITS:
            db_name = "traits_data.db"

        case db.TEAMS:
            db_name = "trainer_teams.db"
        
        case db.ENCOUNTERS:
            db_name = "encounter_tables.db"

    #generate filepath
    filepath = os.path.join("./Databases", db_name)

    #create and return connection
    output = sql.connect(filepath)
    return output

def GetCSVFile(database):
    """
    This function connects to the desired CSV file and returns 

    :param database: desired CSV to connect to
    :type database: Enum db

    :return: filepath of CSV file
    :rtype: string
    """

    match database:
        case  db.DEMONS:
            CSV_name = "Demons.csv"
        
        case db.SKILLS:
            CSV_name = "Skills.csv"
        
        case db.TRAITS:
            CSV_name = "Traits.csv"

        case db.TEAMS:
            db_name = "Teams.csv"
        
        case db.ENCOUNTERS:
            CSV_name = "Encounters.csv"

    
    #generate and output filepath
    output = os.path.join("./TestEnvironments", "DevTools", "PythonStuff", CSV_name)

    return output

def CreateCommand(database):
    """
    This function creates the command that makes the table in the database

    :param database: database working with
    :type database: Enum db

    :return: full command
    :rtype: string
    """
    match database:
        case db.DEMONS:
            command1 = "CREATE TABLE IF NOT EXISTS demon(id, name, arcana, level, "
            command2 = "skill0, skill1, skill2, skill3, skill4, skill5, skill6, skill7, trait, "
            command3 = "st, ma, en, ag, lu, hp, sp, "
            command4 = "slash, strike, gun, fire, ice, elec, wind, psy, nuke, bless, curse, "
            command5 = "inheritance, battack, learnlvls, lvlupskills, background, fakename, mobility, evolve)"
            output = command1 + command2 + command3 + command4 + command5
        
        case db.SKILLS:
            command1 = "CREATE TABLE IF NOT EXISTS skill(id, name, type, subtype, "
            command2 = "power, accuracy, hit_min, hit_max, aoe, cost, "
            command3 = "trigger_condition, skill_conditions, ailment, ailment_chance, "
            command4 = "crit_chance, status, effect, description, inherit, scaling, priority)"
            output = command1 + command2 + command3 + command4
        
        case db.TRAITS:
            return False #temp

        case db.TEAMS:
            return False #temp
        
        case db.ENCOUNTERS:
            return False #temp
        
    return output

def EnterData(database, data, cur, debug=Debug.NONE):
    """
    This function enters data into the database

    :param database: database working with
    :param data: data to enter
    :param cur: sqlite cursor
    :param debug: debug level (optional)

    :type database: Enum db
    :type data: dict
    :type cur: sqlite cursor
    :type debug: Debug enum

    :return: true if succeeded, false if failed
    :rtype: bool
    """

    match database:
        case  db.DEMONS:
            #check if the demon is already in the database
            cur.execute("SELECT * FROM demon WHERE id = ?", (data['ID'],))
            existing = cur.fetchone()

            if existing == None:
                #demon does not exist. Add it.
                data1 = "INSERT INTO demon VALUES(:ID, :Name, :Arcana, :Level, :Skill0, :Skill1, :Skill2, :Skill3, "
                data2 = ":Skill4, :Skill5, :Skill6, :Skill7, :Trait, :St, :Ma, :En, :Ag, :Lu, :HP, :SP, "
                data3 = ":Slash, :Strike, :Gun, :Fire, :Ice, :Elec, :Wind, :Psy, :Nuke, :Bless, :Curse, "
                data4 = ":Inheritance, :BAttack, :LearnLvls, :LvlUpSkills, :Background, :FakeName, :Mobility, :Evolve)"
                
                entry = data1+data2+data3+data4

                cur.execute(entry, data)
                if debug != Debug.NONE:
                    print("created new entry for " + data['Name'])
                return True
            else:
                #demon exists. Check if it needs to be updated
                changes = [
                    data[key] != existing[idx]
                    for idx, key in enumerate(demon_columns)
                    if key != 'id'

                ]
                if any(changes):
                    # Build SET clause dynamically
                    set_clause = ", ".join([f"{col} = :{col}" for col in demon_columns if col != 'ID'])
                    query = f"UPDATE demon SET {set_clause} WHERE ID = :ID"
                    cur.execute(query, data)
                    if debug != Debug.NONE:
                        print("entry for " + data['Name'] + " updated")
                    return True
                else:
                    if debug == Debug.VERBOSE:
                        print("no changes for " + data['Name'])
                    return True
        
        case db.SKILLS:
            #check if the skill is already in the database
            cur.execute("SELECT * FROM skill WHERE name = ?", (data['name'],))
            existing = cur.fetchone()

            if existing == None:
                #skill does not exist. Add it.
                data1 = "INSERT INTO skill VALUES(:id, :name, :type, :subtype, :power, :accuracy, :hit_min, :hit_max, "
                data2 = ":aoe, :cost, :trigger_condition, :skill_conditions, :ailment, :ailment_chance, "
                data3 = ":crit_chance, :status, :effect, :description, :inherit, :scaling, :priority)"
                
                entry = data1+data2+data3

                cur.execute(entry, data)
                if debug != Debug.NONE:
                    print("created new entry for " + data['name'])
                return True
            else:
                #skill exists. Check if it needs to be updated
                changes = [
                    data[key] != existing[idx]
                    for idx, key in enumerate(skill_columns)
                    if key != 'id'

                ]
                if any(changes):
                    # Build SET clause dynamically
                    set_clause = ", ".join([f"{col} = :{col}" for col in skill_columns if col != 'id'])
                    query = f"UPDATE skill SET {set_clause} WHERE id = :id"
                    cur.execute(query, data)
                    if debug != Debug.NONE:
                        print("entry for " + data['name'] + " updated")
                    return True
                else:
                    if debug == Debug.VERBOSE:
                        print("no changes for " + data['name'])
                    return True
        
        case db.TRAITS:
            return False #temp

        case db.TEAMS:
            return False #temp
        
        case db.ENCOUNTERS:
            return False #temp

def UpdateDemons(debug=Debug.NONE):
    """
    This function updates all the data for the demons in the database, drawing from the Demons.csv file.

    :param debug: debug level (optional)
    :type debug: Debug enum

    :return: True if successful, False otherwise
    :rtype: bool
    """
    try:
        con = CreateOrConnectToDB(db.DEMONS)

        csv_filepath = GetCSVFile(db.DEMONS)

        cur = con.cursor()

        #create command
        full_command = CreateCommand(db.DEMONS)

        cur.execute(full_command)


        with open(csv_filepath, mode='r', newline='') as file:
            #assign data as a dictionary
            reader = csv.DictReader(file)

            for row in reader:

                EnterData(db.DEMONS, row, cur, debug)

            

        con.commit()

        con.close()

        return True
    except:
        traceback.print_exc()
        return False
    
def UpdateSkills(debug=Debug.NONE):
    """
    This function updates all the data for the skills in the database, drawing from the Skills.csv file.

    :param debug: debug level (optional)
    :type debug: Debug enum

    :return: True if successful, False otherwise
    :rtype: bool
    """
    try:
        con = CreateOrConnectToDB(db.SKILLS)

        csv_filepath = GetCSVFile(db.SKILLS)

        cur = con.cursor()

        #create command
        full_command = CreateCommand(db.SKILLS)

        cur.execute(full_command)


        with open(csv_filepath, mode='r', newline='') as file:
            #assign data as a dictionary
            reader = csv.DictReader(file)

            for row in reader:

                EnterData(db.SKILLS, row, cur, debug)

            

        con.commit()

        con.close()

        return True
    except:
        traceback.print_exc()
        return False

def main():
    UpdateDemons(Debug.VERBOSE)
    UpdateSkills()
    
        


if __name__ == "__main__":
    sys.exit(main())