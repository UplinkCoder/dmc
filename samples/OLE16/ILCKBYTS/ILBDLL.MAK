ORIGIN		= Symantec C++
ORIGIN_VER	= Version 7.22
VERSION		= DEBUG

!IFDEF SUB_DEBUG
DEBUG		= $(SUB_DEBUG)
NDEBUG		= !$(SUB_DEBUG)
!ELSE
DEBUG		= 1
NDEBUG		= 0
!ENDIF

PROJ		= ILBDLL
APPTYPE		= WINDOWS DLL
PROJTYPE	= DLL

CC		= SC
CPP		= SPP
JAVAC		= sj
MAKE		= SMAKE
RC		= RCC
HC		= HC31
ASM		= SC
DISASM		= OBJ2ASM
LNK		= LINK
DLLS		= 

HEADERS		= ..\..\..\include\windows.h ..\..\..\include\win16\WINDOWS.H ..\..\..\include\ole2.h  \
		..\..\..\include\win16\OLE2.H ..\..\..\include\string.h ..\..\..\include\compobj.h ..\..\..\include\win16\COMPOBJ.H  \
		..\..\..\include\win16\scode.h ..\..\..\include\win16\coguid.h ..\..\..\include\win16\oleguid.h ..\..\..\include\dvobj.h  \
		..\..\..\include\win16\DVOBJ.H ..\..\..\include\storage.h ..\..\..\include\win16\STORAGE.H ..\..\..\include\moniker.h  \
		..\..\..\include\win16\MONIKER.H memstm.h ..\..\..\include\assert.h ..\..\..\include\initguid.h  \
		..\..\..\include\win16\initguid.h 

DEFFILE		= ilbdll.def

!IF $(DEBUG)
OUTPUTDIR	= .
!IF EXIST (.)
CREATEOUTPUTDIR	=
!ELSE
CREATEOUTPUTDIR	= if not exist $(OUTPUTDIR)\*.* md $(OUTPUTDIR)
!ENDIF
TARGETDIR	= ..\bin
!IF EXIST (..\bin)
CREATETARGETDIR	=
!ELSE
CREATETARGETDIR	= if not exist $(TARGETDIR)\*.* md $(TARGETDIR)
!ENDIF

SYMROOT		= 
SYMS		= 
LIBS		= LIBW.LIB COMMDLG.LIB SHELL.LIB OLE2.LIB OLECLI.LIB OLESVR.LIB SHELL.LIB OLE2DISP.LIB OLE2NLS.LIB COMPOBJ.LIB STORAGE.LIB TYPELIB.LIB 

CFLAGS		=  -mlw -C -WD -S -2 -a2 -c -w- -w2 -w6 -w7 -g 
LFLAGS		=  /CO /PAC:65530 /DE /PACKF /XU /A:16 /IMPL:$(TARGETDIR)\$$SCW$$.LIB
DEFINES		= -D_DEBUG=1
!ELSE
OUTPUTDIR	= .
!IF EXIST (.)
CREATEOUTPUTDIR	=
!ELSE
CREATEOUTPUTDIR	= if not exist $(OUTPUTDIR)\*.* md $(OUTPUTDIR)
!ENDIF
TARGETDIR	= ..\bin
!IF EXIST (..\bin)
CREATETARGETDIR	=
!ELSE
CREATETARGETDIR	= if not exist $(TARGETDIR)\*.* md $(TARGETDIR)
!ENDIF

SYMROOT		= 
SYMS		= 
LIBS		= LIBW.LIB COMMDLG.LIB SHELL.LIB OLE2.LIB OLECLI.LIB OLESVR.LIB SHELL.LIB OLE2DISP.LIB OLE2NLS.LIB COMPOBJ.LIB STORAGE.LIB TYPELIB.LIB 

CFLAGS		=  -mlw -C -o+time -WD -2 -a2 -c -w- -w2 -w6 -w7 
LFLAGS		=  /PAC:65530 /DE /PACKF /XU /A:16 /IMPL:$(TARGETDIR)\$$SCW$$.LIB
DEFINES		= 
!ENDIF

HFLAGS		= $(CFLAGS) 
MFLAGS		= MASTERPROJ=$(PROJ) 
LIBFLAGS	=  /C /P:512 
RESFLAGS	=  
DEBUGGERFLAGS	=  
AFLAGS		= $(CFLAGS) 
HELPFLAGS	= 

MODEL		= L

PAR		= PROJS BATS OBJS

RCDEFINES	= 

INCLUDES	= -I.

INCLUDEDOBJS	= 

OBJS		=  $(OUTPUTDIR)\memstm.OBJ 

RCFILES		= 

RESFILES	= 

HELPFILES	= 

BATS		= 

PRECOMPILE	= 

POSTCOMPILE	= 

POSTLINK	=  movelib?Pbat 

.SUFFIXES: .C .CP .CPP .CXX .CC .H .HPP .HXX .COM .EXE .DLL .LIB .RTF .DLG .ASM .RES .RC .OBJ 

.C.OBJ:
	$(CC) $(CFLAGS) $(DEFINES) $(INCLUDES) -o$*.obj $*.c

.CPP.OBJ:
	$(CC) $(CFLAGS) $(DEFINES) $(INCLUDES) -o$*.obj $*.cpp

.CXX.OBJ:
	$(CC) $(CFLAGS) $(DEFINES) $(INCLUDES) -o$*.obj $*.cxx

.CC.OBJ:
	$(CC) $(CFLAGS) $(DEFINES) $(INCLUDES) -o$*.obj $*.cc

.CP.OBJ:
	$(CC) $(CFLAGS) $(DEFINES) $(INCLUDES) -o$*.obj $*.cp

.H.SYM:
	$(CC) $(HFLAGS) $(DEFINES) $(INCLUDES) -HF -o$(*B).sym $*.h

.HPP.SYM:
	$(CC) $(HFLAGS) $(DEFINES) $(INCLUDES) -HF -o$(*B).sym $*.hpp

.HXX.SYM:
	$(CC) $(HFLAGS) $(DEFINES) $(INCLUDES) -HF -o$(*B).sym $*.hxx

.C.EXP:
	$(CPP) $(CFLAGS) $(DEFINES) $(INCLUDES)   $*.c   -o$*.lst

.CPP.EXP:
	$(CPP) $(CFLAGS) $(DEFINES) $(INCLUDES) $*.cpp -o$*.lst

.CXX.EXP:
	$(CPP) $(CFLAGS) $(DEFINES) $(INCLUDES) $*.cxx -o$*.lst

.CP.EXP:
	$(CPP) $(CFLAGS) $(DEFINES) $(INCLUDES)  $*.cp  -o$*.lst

.CC.EXP:
	$(CPP) $(CFLAGS) $(DEFINES) $(INCLUDES)  $*.cc  -o$*.lst

.ASM.EXP:
	$(CPP) $(CFLAGS) $(DEFINES) $(INCLUDES) $*.asm -o$*.lst

.OBJ.COD:
	$(DISASM) $*.OBJ -c

!IF $(DEBUG)
.OBJ.EXE:
		$(LNK) $(LFLAGS) @<<$(PROJ).LNK
.\memstm.OBJ
..\bin\$$SCW$$.DLL
NUL
.\ LIBW.LIB COMMDLG.LIB SHELL.LIB OLE2.LIB OLECLI.LIB OLESVR.LIB SHELL.LIB OLE2DISP.LIB OLE2NLS.LIB COMPOBJ.LIB STORAGE.LIB TYPELIB.LIB 
ilbdll.def;
<<
!ELSE
.OBJ.EXE:
		$(LNK) $(LFLAGS) @$(PROJ).LNK<<
.\memstm.OBJ
..\bin\$$SCW$$.DLL
NUL
.\ LIBW.LIB COMMDLG.LIB SHELL.LIB OLE2.LIB OLECLI.LIB OLESVR.LIB SHELL.LIB OLE2DISP.LIB OLE2NLS.LIB COMPOBJ.LIB STORAGE.LIB TYPELIB.LIB 
ilbdll.def;
<<
!ENDIF

.RTF.HLP:
	$(HC) $(HELPFLAGS) $*.HPJ

.ASM.OBJ:
	$(ASM) $(AFLAGS) $(DEFINES) $(INCLUDES) -o$*.obj $*.asm

.RC.RES: 
	$(RC) $(RCDEFINES) $(RESFLAGS) $(INCLUDES) $*.rc -o$*.res

.DLG.RES:
	echo ^#include "windows.h" >$$$*.rc
	echo ^IF EXIST "$*.h" >>$$$*.rc
	echo ^#include "$*.h" >>$$$*.rc
	echo ^#include "$*.dlg" >>$$$*.rc
	$(RC) $(RCDEFINES) $(RESFLAGS) $(INCLUDES) $$$*.rc
	-del $*.res
	-ren $$$*.res $*.res



all:	noteout createdir $(PRECOMPILE) $(SYMS) $(OBJS) $(INCLUDEDOBJS) $(POSTCOMPILE) $(TARGETDIR)\$(PROJ).$(PROJTYPE) $(POSTLINK) _done


all2:	createdir $(PRECOMPILE) $(SYMS) $(OBJS) $(INCLUDEDOBJS) $(POSTCOMPILE) $(TARGETDIR)\$(PROJ).$(PROJTYPE) $(POSTLINK) _done

noteout:
	REM Output to $(OUTPUTDIR)

createdir:
	$(CREATEOUTPUTDIR)
	$(CREATETARGETDIR)
	
$(TARGETDIR)\$(PROJ).$(PROJTYPE): $(OBJS) $(INCLUDEDOBJS) $(RCFILES) $(RESFILES) $(HELPFILES) $(DEFFILE)
			-del $(TARGETDIR)\$(PROJ).$(PROJTYPE)
!IF $(DEBUG)
		$(LNK) $(LFLAGS) @<<$(PROJ).LNK
.\memstm.OBJ
..\bin\$$SCW$$.DLL
NUL
.\ LIBW.LIB COMMDLG.LIB SHELL.LIB OLE2.LIB OLECLI.LIB OLESVR.LIB SHELL.LIB OLE2DISP.LIB OLE2NLS.LIB COMPOBJ.LIB STORAGE.LIB TYPELIB.LIB 
ilbdll.def;
<<
!ELSE
		$(LNK) $(LFLAGS) @<<$(PROJ).LNK
.\memstm.OBJ
..\bin\$$SCW$$.DLL
NUL
.\ LIBW.LIB COMMDLG.LIB SHELL.LIB OLE2.LIB OLECLI.LIB OLESVR.LIB SHELL.LIB OLE2DISP.LIB OLE2NLS.LIB COMPOBJ.LIB STORAGE.LIB TYPELIB.LIB 
ilbdll.def;
<<
!ENDIF

			-ren $(TARGETDIR)\$$SCW$$.$(PROJTYPE) $(PROJ).$(PROJTYPE)
			-del $(TARGETDIR)\$(PROJ).LIB
			-ren $(TARGETDIR)\$$SCW$$.LIB $(PROJ).LIB
			-echo $(TARGETDIR)\$(PROJ).$(PROJTYPE) built

_done:
		REM  Project is up to date

buildall:	clean	all


clean:
		-del $(TARGETDIR)\$$SCW$$.$(PROJTYPE)
		-del $(PROJ).CLE
		-del $(OUTPUTDIR)\SCPH.SYM
		-del ILBDLL.dpd
		-del $(OBJS)

cleanres:

res:		cleanres $(RCFILES) all


link:
!IF $(DEBUG)
		$(LNK) $(LFLAGS) @<<$(PROJ).LNK
.\memstm.OBJ
..\bin\$$SCW$$.DLL
NUL
.\ LIBW.LIB COMMDLG.LIB SHELL.LIB OLE2.LIB OLECLI.LIB OLESVR.LIB SHELL.LIB OLE2DISP.LIB OLE2NLS.LIB COMPOBJ.LIB STORAGE.LIB TYPELIB.LIB 
ilbdll.def;
<<
!ELSE
		$(LNK) $(LFLAGS) @<<$(PROJ).LNK
.\memstm.OBJ
..\bin\$$SCW$$.DLL
NUL
.\ LIBW.LIB COMMDLG.LIB SHELL.LIB OLE2.LIB OLECLI.LIB OLESVR.LIB SHELL.LIB OLE2DISP.LIB OLE2NLS.LIB COMPOBJ.LIB STORAGE.LIB TYPELIB.LIB 
ilbdll.def;
<<
!ENDIF

		-del $(TARGETDIR)\$(PROJ).$(PROJTYPE)
		-ren $(TARGETDIR)\$$SCW$$.$(PROJTYPE) $(PROJ).$(PROJTYPE)
			-del $(TARGETDIR)\$(PROJ).LIB
			-ren $(TARGETDIR)\$$SCW$$.LIB $(PROJ).LIB





movelib?Pbat:
		..\bin\movelib.bat 



!IF EXIST (ILBDLL.dpd)
!INCLUDE ILBDLL.dpd
!ENDIF



$(OUTPUTDIR)\memstm.OBJ:	memstm.cpp
		$(CC) $(CFLAGS) $(DEFINES) $(INCLUDES) -o$(OUTPUTDIR)\memstm.obj memstm.cpp




