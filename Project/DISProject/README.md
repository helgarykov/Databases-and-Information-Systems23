# Overview of the group (DIS) project
This project was collaborated on by:
- Helga Rykov Ibsen (mcv462)
- Laust Christian Blixencrone-Møller (sbh546)
- Victor Alexander Schmidt (rqc908)

## The project in parts

### DIS-Project (report)
Design choices, practical information (such as how to run) and such can be found the report. Please take a look.

***Looking for the ER-Diagram?*** It lies within the report. You're welcome.

### EasyTranslate directory
Contains the server code. Required to run the code: `.NET 7.203`. Subsequent dependencies can be seen in the report.

### PostgreSQL directory
All SQL related to creating and populating tables. Used in the creation scripts.

### Database scripts
For more elaborate descriptions of how to run, please read the report (section 4 is ''How to run'' the project).

**DO NOTE**: To run these scripts, one needs PostgreSQL installed, with the user `postgres` with password `1234`

For Mac or Linux, please use the `Bash_DB_Script.sh` to create and seed the PostgreSQL `easy_translate` database. Before running this script, you may want to run the following line in the terminal: `chmod +x Bash\_DB\_Script.sh`

On Windows, please run the `Windows_DB_Script.cmd` instead.
