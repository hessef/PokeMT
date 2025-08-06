#============================================================================================
#this code is meant to update the sqlite databases for PokeMT and should only be used by devs
#============================================================================================

import sqlite3 as sql
import sys
import os
from enum import Enum
import csv

class db(Enum):
    DEMONS      = 0
    SKILLS      = 1
    TRAITS      = 2
    TEAMS       = 3
    ENCOUNTERS  = 4

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
    output = os.path.join("./TestEnvironments", "DevTools", CSV_name)

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
            command1 = "CREATE TABLE IF NOT EXISTS demon(name, arcana, level, "
            command2 = "skill0, skill1, skill2, skill3, skill4, skill5, skill6, skill7, trait,"
            command3 = "st, ma, en, ag, lu, hp, sp, "
            command4 = "slash, strike, gun, fire, ice, elec, wind, psy, nuke, bless, curse, "
            command5 = "inheritance, battack, learnlvls, lvlupskills, background)"
            output = command1 + command2 + command3 + command4 + command5
        
        case db.SKILLS:
            return False #temp
        
        case db.TRAITS:
            return False #temp

        case db.TEAMS:
            return False #temp
        
        case db.ENCOUNTERS:
            return False #temp
        
    return output

def EnterData(database, data, cur):
    """
    This function enters data into the database

    :param database: database working with
    :param data: data to enter
    :param cur: sqlite curson

    :type database: Enum db
    :type data: dict
    :type cur: sqlite cursor

    :return: true if succeeded, false if failed
    :rtype: bool
    """

    match database:
        case  db.DEMONS:
            #check if the demon is already in the database
            cur.execute("SELECT * FROM demon WHERE name = ?", data['Name'])
            existing = cur.fetchone()

            if existing == None:
                data1 = "INSERT OR REPLACE INTO demon VALUES(:Name, :Arcana, :Level, :Skill0, :Skill1, :Skill2, :Skill3, "
                data2 = ":Skill4, :Skill5, :Skill6, :Skill7, :Trait, :St, :Ma, :En, :Ag, :Lu, :HP, :SP, "
                data3 = ":Slash, :Strike, :Gun, :Fire, :Ice, :Elec, :Wind, :Psy, :Nuke, :Bless, :Curse, "
                data4 = ":Inheritance, :BAttack, :LearnLvls, :LvlUpSkills, :Background)"
                
                entry = data1+data2+data3+data4

                cur.execute(entry, data)
                print("created new entry for " + data['Name'])
        
        case db.SKILLS:
            return False #temp
        
        case db.TRAITS:
            return False #temp

        case db.TEAMS:
            return False #temp
        
        case db.ENCOUNTERS:
            return False #temp

def main():
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

            EnterData(db.DEMONS, row, cur)

        

    con.commit()

    #make sure it worked
    res = cur.execute("SELECT name FROM demon")
    res.fetchall()
        


if __name__ == "__main__":
    sys.exit(main())