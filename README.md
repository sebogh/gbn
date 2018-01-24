# gbn

## Einleitung

*gbn* ist eine Klasse zum Erstellen deutscher Briefe nach [DIN 5008](http://de:wikipedia:org/wiki/DIN_5008).

## Verwendung

## Beispiel

Das folgende Minimal-Beispiel soll die Verwendung der Klasse demonstrieren:

~~~~ {.latex}
\documentclass{gbn}
\fromname {Sebastian Bogan}
\fromstrassehaus {Kurfürstendamm 1}
\fromplzort {10719 Berlin}
\toanrede {Herr}
\toname {Geneigter Leser}
\tostrassehaus {Grunewaldstr. 1}
\toplzort {13353 Berlin}
\betreff{Groÿe Idee}
\begruessung{Sehr geehrte Herr Leser,}
\begin{document}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do
eiusmod tempor incididunt ut labore et dolore magna aliqua.
\end{document}
~~~~

## Optionen

`subjectsep`

:   Mittels `subjectsep=<dim>` kann der vertikale Abstand zwischen Datum und
    Betreff verändert werden.

