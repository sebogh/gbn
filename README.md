# gbn

## Einleitung

*gbn* ist eine Klasse zum Erstellen deutscher Briefe nach [DIN 5008].

(siehe auch [gbn.pdf](./gbn.pdf))

## Verwendung

### Beispiel

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
\betreff{Große Idee}
\begruessung{Sehr geehrter Herr Leser,}
\begin{document}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do
eiusmod tempor incididunt ut labore et dolore magna aliqua.
\end{document}
~~~~

## Optionen

-   `subjectsep`: Mittels `subjectsep=<dim>` kann der vertikale Abstand zwischen
    Datum und Betreff verändert werden.

-   `salutsep` Mittels `salutsep=<dim>` kann der vertikale Abstand zwischen
    Betreff und Begrüßung verändert werden.

-   `bodysep` Mittels `bodysep=<dim>` kann der vertikale Abstand zwischen
    Betreff und Text verändert werden

-   `rules` Mittels `rules` werden Linien unterhalb der Kopfzeile und oberhalb
    der Fußzeile gesetzt.

-   `rulers` Mittels `rulers` wird ein Linieal eingeblendet diese Option dient
    im Wensentlichen der Entwicklung.

-   `plain` Mittels `plain` werden sämtliche Elemente der ersten Seite
    weggelassen und der Text beginnt auf einer regulären Seite.

-   `gbnlastpage` Wenn die Option`gbnlastpage` gesetzt ist, wird der counter
    `gbnlastpage` angelegt und in der Fusszeile:

    ~~~~ {.latex}
    <Seite>/|\arabic{gbnlastpage}
    ~~~~

    statt:

    ~~~~ {.latex}
    <Seite>/|\arabic{gbnlastpage}
    ~~~~

    verwendet. Auf diese Weise kann die Gesamt-Seitenzahl nach Bedarf angepasst
    werden. Dies ist vor allem dann nützlich, wenn der `page` counter
    zwischendurch zurückgesetzt werden muss/soll.

## Kommandos

### Farben

Die folgenden Kommandos legen Farben fest. Jedes dieser Kommandos erwarte
RGB-Tripel als Argument. Beispielsweise würde `\linecolor={1.0,0.0,1.0}` Magenta
(Fuchsia) als Farbe für die Fenstermarkierungen und Faltmarken festlegen.

-   `\linecolor` Legt die Farbe der Fenstermarkierungen und der Faltmarken fest.

-   `\rulecolor` Legt die Farbe der Linie unterhalb der Kopfzeile oberhalb der
    Fußzeile fest. Diese Einstellung hat nur sichtbare Auswirkungen, wenn die
    Klassen-Option `rules` verwendet wird.

-   `\headercolor` Legt die Schriftfarbe der Kopfzeile fest.

-   `\footercolor` Legt die Schriftfarbe der Fußzeile fest.

-   `\retourcolor` Legt die Schriftfarbe der Rücksende-Adresse oberhalb der
    Anschrift fest.

### Beschreibende Texte

Die folgenden Kommandos legen beschreibende Texte, die innerhalb der Fußzeile
verwendet werden, fest. Jedes dieser Kommandos erwartet genau ein Argument. Das
Argument kann ein einfacher Text oder komplexer Latex-Code sein. Mit
`\TelefonText{Tel.:}`, z.B., würde der Text vor der Telefonnummer auf “Tel.:”
festgelegt werden.

-   `\telefontext` beschreibender Text für die Telefonnummer des Absenders
    (standarmäßig “Telefon:”)

-   `\telefaxtext` beschreibender Text für die Telefaxnummer des Absenders
    (standarmäßig “Telefax:”)

-   `\emailtext` beschreibender Text für die E-Mail-Adresse des Absenders
    (standarmäßig “E-Mail:”)

-   `\httptext` beschreibender Text für die HTTP-Adresses des Absenders
    (standarmäßig “HTTP:”)

-   `\banktext` beschreibender Text für den Namen der Bank des Absenders
    (standarmäßig “Bankverbindung:”)

-   `\blztext` beschreibender Text für die BLZ des Absenders (standarmäßig
    “BLZ:”)

-   `\kontotext` beschreibender Text für die Kontonummer des Absenders
    (standarmäßig “Konto:”)

-   `\blztext` beschreibender Text für die IBAN des Absenders (standarmäßig
    “IBAN:”)

-   `\kontotext` beschreibender Text für die BIC des Absenders (standarmäßig
    “BIC:”)

### Header

-   `\headername` Name (Text) der im Header angezeigt wird (standardmäßig
    `\fromname`)

### Absender

-   `\fromtitel` akademischer Titel des Absenders (z.B. “Dr.”)

-   `\fromname` Vor- und Nachname des Absenders

-   `\fromstrassehaus` Straße des Absenders

-   `\fromplzort` Postleitzahl des Absenders

-   `\fromland` Land des Absenders

-   `\fromtelefon` Telefon des Absenders

-   `\fromtelefax` Telefax des Absenders

-   `\fromemail` E-Mail-Adresse des Absenders (z.B. “sebogh@qibli.net”)

-   `\fromhttp` HTTP-Adresse des Absenders

-   `\frombank` Name der Bank des Absenders (wird nur verwendet, wenn die
    `\fromiban` nicht gesetzt ist und sowohl `\fromblz` als auch `\fromkonto`
    gesetzt sind)

-   `\fromblz` BLZ des Absenders (wird nur verwendet, wenn die `\fromiban` nicht
    gesetzt ist und sowohl `\frombank` als auch `\fromkonto` gesetzt sind)

-   `\fromkonto` Kontonummer des Absenders (wird nur verwendet, wenn die
    `\fromiban` nicht gesetzt ist und sowohl `\frombank` als auch `\fromblz`
    gesetzt sind)

-   `\fromiban` IBAN des Absenders

-   `\frombic` BIC des Absenders

### Empfänger

-   `\tofirma` Empfänger-Firma

-   `\toanrede` Anrede für den Empfänger (“Frau” oder “Herr”)

-   `\totitel` akademischer Titel des Empfängers

-   `\toname` Vor- und Nachname des Empfängers

-   `\tostrassehaus` Straße des Empfängers

-   `\toplzort` Postleitzahl des Empfängers

-   `\toland` Land des Empfängers

### Zusatz- und Vermerkzone

-   `\zvzthree` 3. Zusatz- und Vermerkzone (z.B. elektronische
    Freimachungsvermerke)

-   `\zvztwo` 2. Zusatz- und Vermerkzone (z.B. Vorausverfügung “Nicht
    nachsenden!” bzw. “Bei Umzug mit neuer Anschrift zurück!”)

-   `\zvzone` 1. Zusatz- und Vermerkzone (z.B. “Einschreiben/Recommandé”)

### Sonstiges

-   `\datum` Datum des Schreibens (standarmäßig `\today`)

-   `\begruessung` Begrüßungstext (z.B. “Sehr geehrter Herr Bogan,”)

-   `\betreff` Betreff

-   `\gruss` Gruß (standardmäßig “Mit freundlichen Grüßen”)

-   `\unterschrift` Unterschrift (standardmäßig der Vor- und Nachname des
    Absenders)

-   `\signatur` Signatur (Bild-Datei, die die Signatur enthält). Ist `\signatur`
    gesetzt, dann wird `\unterschrift` ignoriert. Ist die Bild-Datei über die
    `TEXINPUTS` zu finden, dann reicht der Name der Datei.

-   `\anlagen` Anlagen-Text (z.B. einfach “Anlagen” (siehe
    [din-5008-richtlinien.de])

  [DIN 5008]: http://de:wikipedia:org/wiki/DIN_5008
  [din-5008-richtlinien.de]: din-5008-richtlinien.de
