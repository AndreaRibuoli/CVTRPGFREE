# CVTRPGFREE

by *Paul de Valmency*

Converts an RPGLE source member from fixed-format RPG to free-form RPG.

----

Files included:

```
CVTRPGFREE.CMD      - Command
CVTRPGFREH.PNLGRP   - Command help panel group
CVTRPGFREC.CLLE     - Command processing program
CVTRPGFRP1.PRTF     - Printer file
CVTRPGFRER.SQLRPGLE - SQLRPGLE program
```

Please submit any issues or requests [via sourceforge](https://sourceforge.net/p/cvtrpgfree/tickets/)

----

by *Andrea Ribuoli*

Files included:

```
GUIDANCE.TXT        - Required source files for IBM i installation
BUILD.CLLE          - Installation
BUILD.TXT           - Installation
```

The ILE CL source and TMKMAKE script that automate installation via *PASERIE* utility.

----

### Installation

To install (via **PASERIE**):

```
PASERIE/INSTALL REPO_OWNER(AndreaRibuoli) REPOSITORY(CVTRPGFREE)
```

you will have the package installed from source:

```
Library . . . . .   CVTRPGFREE       Position to . . . . . . . .              
                                     Position to type  . . . . .              
                                                                              
Type options, press Enter.                                                    
  2=Change       3=Copy        4=Delete      5=Display       7=Rename         
  8=Display description        9=Save       10=Restore      11=Move ...       
                                                                              
Opt  Object      Type        Attribute   Text                                 
     CVTRPGFREC  *PGM        CLLE        Command processing program           
     CVTRPGFRER  *PGM        RPGLE       SQLRPGLE program                     
     CVTRPGFRP1  *FILE       PRTF        Printer file                         
     CVTRPGFREE  *CMD                    Command                              
     CVTRPGFREH  *PNLGRP                 Command help panel group             
                                                                              
                                                                              
                                                                              
                                                                        Bottom

```