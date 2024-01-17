/*=============================================================================+
 * Compilation steps (use BUILD):                                              +
 *=============================================================================+
 * *> CRTCMD CMD(&O/&ON) PGM(*LIBL/CVTRPGFREC) SRCFILE(&L/&F)            -  <* +
 * *>        MODE(*ALL) ALLOW(*ALL)                                      -  <* +
 * *>        HLPPNLGRP(CVTRPGFREH) HLPID(*CMD)                           -  <* +
 * *>        TEXT(&X)                                                       <* +
 *============================================================================*/
/*==================================================================*/
/*   Programmer: Ewarwoowar                                         */
/*   Date      : 08/05/15                                           */
/*                                                                  */
/*   Function  : Converts an RPG/ILE fixed-format source to         */
/*               free-format.                                       */
/*                                                                  */
/*   CPP       : CVTRPGFREC                                         */
/*                                                                  */
/********************************************************************/
             CMD        PROMPT('Converti RPG/ILE in Free-form')

             PARM       KWD(FROMMBR) TYPE(*NAME) SPCVAL((*ALL)) MIN(1) +
                          PROMPT('Da membro')

             PARM       KWD(FROMFILE) TYPE(FRMFILE) PROMPT('Da file')
 FRMFILE:    QUAL       TYPE(*NAME) DFT(QRPGLESRC) SPCVAL((QRPGLESRC)) +
                          EXPR(*YES)
             QUAL       TYPE(*NAME) DFT(*LIBL) SPCVAL((*CURLIB) (*LIBL)) +
                          EXPR(*YES) PROMPT('Libreria')

             PARM       KWD(TOFILE) TYPE(TOFILE) PROMPT('A file')
 TOFILE:     QUAL       TYPE(*NAME) LEN(10) DFT(QRPGLESRC)
             QUAL       TYPE(*NAME) DFT(*FROMLIB) SPCVAL((*FROMLIB) +
                          (*CURLIB) (*LIBL)) PROMPT('Libreria')

             PARM       KWD(TOMBR) TYPE(*NAME) DFT(*FROMMBR) +
                          SPCVAL((*FROMMBR)) PROMPT('A membro')


             PARM       KWD(INDINC) TYPE(*DEC) LEN(1) RSTD(*YES) DFT(3) +
                          VALUES(2 3 4) CHOICEPGM(*NONE) PMTCTL(*PMTRQS) +
                          PROMPT('Incremento di indentazione')

             PARM       KWD(INDCMT) TYPE(*CHAR) LEN(1) RSTD(*YES) DFT(Y) VALUES(Y N) +
                          PMTCTL(*PMTRQS) PROMPT('Indenta i commenti?')

             PARM       KWD(RETBLKCMT) TYPE(*CHAR) LEN(1) RSTD(*YES) DFT(N) VALUES(Y N) +
                          PMTCTL(*PMTRQS) PROMPT('Mantieni i marcatori di commento vuoti?')

             PARM       KWD(RMVCMTEND) TYPE(*CHAR) LEN(1) RSTD(*YES) DFT(Y) VALUES(Y N) +
                          PMTCTL(*PMTRQS) PROMPT('Rimuovi i marcatori di fine commento?')

             PARM       KWD(RMVNONPRT) TYPE(*CHAR) LEN(1) RSTD(*YES) DFT(Y) VALUES(Y N) +
                          PMTCTL(*PMTRQS) PROMPT('Rimuovi i caratteri non stampabili?')

             PARM       KWD(DIRECTIVES) TYPE(*CHAR) LEN(1) RSTD(*YES) DFT(N) VALUES(Y N) +
                          PMTCTL(*PMTRQS) PROMPT('Utilizza le direttive del compilatore /Free?')

             PARM       KWD(CNVMOVE) TYPE(*CHAR) LEN(1) RSTD(*YES) DFT(Y) +
                          VALUES(Y N) CASE(*MONO) PMTCTL(*PMTRQS) +
                          PROMPT('Converti le istruzioni MOVE?')

             PARM       KWD(CNVKLIST) TYPE(*CHAR) LEN(1) RSTD(*YES) DFT(Y) VALUES(Y N) +
                          CASE(*MONO) PMTCTL(*PMTRQS) PROMPT('Converti gli elenchi di chiavi?')

             PARM       KWD(RETKLIST) TYPE(*CHAR) LEN(1) RSTD(*YES) DFT(Y) VALUES(Y N) +
                          CASE(*MONO) PMTCTL(*PMTRQS) PROMPT('Mantieni gli elenchi di chiavi convertiti?')

             PARM       KWD(CNVPLIST) TYPE(*CHAR) LEN(1) RSTD(*YES) DFT(Y) VALUES(Y N) +
                          CASE(*MONO) PMTCTL(*PMTRQS) PROMPT('Converti gli elenchi di parametri?')
                       
             PARM       KWD(RETPLIST) TYPE(*CHAR) LEN(1) RSTD(*YES) DFT(Y) VALUES(Y N) +
                          CASE(*MONO) PMTCTL(*PMTRQS) PROMPT('Mantieni gli elenchi di parametri convertiti?')

             PARM       KWD(SUPCNVMSGS) TYPE(*CHAR) LEN(1) RSTD(*YES) DFT(N) VALUES(Y N) +
                          CASE(*MONO) PMTCTL(*PMTRQS) PROMPT('Sopprima i messaggi di conversione?')

             PARM       KWD(OPCODECASE) TYPE(*CHAR) LEN(6) RSTD(*YES) DFT(*MIXED) +
                          SPCVAL((*UPPER) (*LOWER) (*MIXED)) PMTCTL(*PMTRQS) PROMPT('Op-code +
                          case')

             PARM       KWD(CNVFULL) TYPE(*CHAR) LEN(1) RSTD(*YES) DFT(N) VALUES(Y N) +
                          CASE(*MONO) PROMPT('Converti in full-free?')

             PARM       KWD(RTNLINMKR) TYPE(*CHAR) LEN(1) RSTD(*YES) DFT(N) VALUES(Y N) +
                          CASE(*MONO) PMTCTL(PMTCNVFULL) PROMPT('Mantieni i marcatori di linea?')

             PARM       KWD(RETMODDAYS) TYPE(*DEC) LEN(3) DFT(999) PMTCTL(*PMTRQS) +
                          PROMPT('Giorni di conservazione mod-marker')

             PARM       KWD(LOGCNV) TYPE(*CHAR) LEN(1) RSTD(*YES) DFT(Y) VALUES(Y N) +
                          PMTCTL(*PMTRQS) PROMPT('Registrazione conversione?')

 PMTCNVFULL: PMTCTL     CTL(CNVFULL) COND((*EQ 'Y'))

