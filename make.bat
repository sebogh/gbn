@ECHO OFF

IF "%1"=="clean" (
	CALL :CLEAN
) ELSE IF "%1"=="tidy" (
	CALL :CLEAN
	CALL :TIDY
) ELSE (
	CALL :DEFAULT
)
GOTO :eof

:DEFAULT
pdflatex gbn.ins
pdflatex gbn.dtx
pdflatex gbn.dtx
pdflatex test-simple.tex
pdflatex test-simple.tex
pdflatex test-complete.tex
pdflatex test-complete.tex
GOTO :eof

:CLEAN
del /s *.aux *.log *.out *~ *.idx *.glo >nul 2>&1
GOTO :eof

:TIDY	
CALL :CLEAN
del /s gbn.cls test-simple.* test-complete.* gbn.pdf >nul 2>&1
GOTO :eof


