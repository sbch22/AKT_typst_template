// =============================================================
// main.typ
// Hier schreibst du den Inhalt deiner Arbeit.
// Layout-Einstellungen werden über tu-thesis(...) konfiguriert.
// =============================================================

#import "template.typ": tu-thesis
#import "@preview/fancy-units:0.1.1": num, unit, qty, fancy-units-configure, add-macros


#show: tu-thesis.with(
  title: "Dein Arbeitstitel",
  author: "Robin Author",
  email: "robin.author@campus.tu-berlin.de",
  names: "R. Author",
  shorttitle: "Kurztitel der Arbeit",
  supervisor: [
    Prof. Dr. Stefan Weinzierl, Dr. Steffen Lepa \
    
  ],
  doctype: "Masterarbeit",

  abstract-de: [
    Hier dein deutsches Abstract. Lorem ipsum dolor sit amet,
    consectetur adipiscing elit. Sed do eiusmod tempor incididunt
    ut labore et dolore magna aliqua.
  ],

  abstract-en: [
    Your English abstract goes here. Lorem ipsum dolor sit amet,
    consectetur adipiscing elit. Sed do eiusmod tempor incididunt
    ut labore et dolore magna aliqua.
  ],


  cols: 2,        // 1 = Thesis (mit TOC), 2 = Paper (ohne TOC)
  col-gutter: 2.5em,
)





// =====================================================
// Ab hier der eigentliche Inhalt deiner Arbeit
// =====================================================



= Tipps für Typst

Dokumentation, Tutorial und Referenz:

https://typst.app/docs/

== Zitieren und Verweisen
#label("sec:zitieren_und_verweisen")

Zitieren und Verweisen mit \@-Zeichen, Bibtex/Biblatex kompatibel @Weinzierl2008.
Labels können wie in LaTeX erstellt und referenziert werden: @sec:zitieren_und_verweisen, @sec:formelsatz, @tab:table

== Formelsatz
#label("sec:formelsatz")

Inline Mathe-Modus: $lambda = 5$ (keine Leerzeichen neben den Dollarzeichen). 

Gleichungen in eigener Zeile:
$ alpha = integral_(-oo)^(oo) x dif x space.quad "(Leerzeichen neben Dollarzeichen)" $

Liste der Symbole: https://typst.app/docs/reference/symbols/sym/


=== Einheiten 
#label("sec:einheiten")


Einheiten mit schmalem Leerzeichen (`thin` oder `med`):
$ x = 5 thin upright(m) $

Noch praktischer: Einheiten automatisiert setzen. 
In der Präampel ist das Paket `fancy-units` geladen, welches das LaTeX Paket `siunitx` imitiert.
Außerdem wurden dort dB, dBu, dBV, etc. als Einheiten deklariert.
Das erlaubt es nun, Einheiten vollautomatisch mit der Funktion `#qty[number][unit]` zu setzen:

$ 10 thin "dB" = #qty[10][dB] $

Die Funktion funktioniert auch im Fließtext, ohne dass der Mathe-Modus aktiviert werden muss: #qty[10][dBu].
Alternativ mit inline-Formel: $#qty[10][dBu] = 10 thin "dBu"$.


=== Dezimaltrennzeichen

Typst unterstützt aktuell nur den Punkt `.` als Dezimaltrennzeichen. Wird im Mathe-Modus ein Komma benutzt, wird die Zahl als ein zweikomponentiger Vektor interpretiert und es wird ein Leerzeichen nach dem Komma gesetzt:

$ r = 5,1 thin upright(m) \
"(ungewünschtes Leerzeichen nach dem Komma)" $
$ wide arrow(x) = (1, 2) \
"(Hier ergibt das Leerzeichen Sinn)" $

Um ein Komma als Trennzeichen zu verwenden, Kann die Funktion in der Präambel genutzt werden. Im Mathe-Modus muss beim Schreiben ein Punkt benutzt werden, dieser wird in der fertigen Ansicht dann als Komma dargestellt. 

$ pi approx 3.14 $

Um einen Punkt als Dezimaltrennzeichen zu nutzen, wenn z.B. auf Englisch geschrieben wird, einfach die Funktion in der Präambel auskommentieren.

== Grafiken
#figure(caption: "Abbildungsbeschreibung in text", image("graphics/THDN.png")) #label("fig:thdn")



== "\textwidth" Grafiken

#place(
  top + center,
  scope: "parent",
  float: true,
  figure(caption: "Abbildungsbeschreibung für volle textwidth", image("graphics/THDN.png"))
)#label("fig:thdn_full_width")


== Tabellen

#figure(caption: "Tabelle",
  table(
      columns: (1fr, 1fr, 1fr), 
      inset: 10pt,
      align: (left+horizon, center+horizon, left+horizon), // align kann spaltenweise gesetzt werden
      stroke: 1pt,
      [],        [*Spalte 1*],      [*Spalte 2*],
      [Zeile 1], [Text],            [Text mit \ Zeilenumbruch],
      [Zeile 2], [$V = 4/3 pi r³$], [$ E = m c^2 $], //inline Formeln (links) bieten sich an
  ) 
) #label("tab:table") // typst erkennt automatisch, dass die figure eine Tabelle enthält


= Einleitung
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.


= Methodik


= Ergebnisse


= Diskussion

#pagebreak()
#bibliography("bib_database.bib", title: "Literatur" , style: "apa")