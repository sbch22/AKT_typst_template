// =============================================================
// declaration.typ
// Eidesstattliche Erklärung. Standard-Text wird genutzt, wenn
// `body` = none. Eigenen Text via `declaration-text: [...]` im
// main.typ überschreiben.
// =============================================================

#let declaration-page(
  author: "",
  date: datetime.today().display("[day].[month].[year]"),
  body: none,
) = {
  let default-text = [
    Hiermit erkläre ich an Eides statt gegenüber der Fakultät I der Technischen Universität Berlin, dass die vorliegende, dieser Erklärung angefügte Arbeit selbstständig und nur unter Zuhilfenahme der im Literaturverzeichnis genannten Quellen und Hilfsmittel angefertigt wurde. 
    Alle Stellen der Arbeit, die anderen Werken dem Wortlaut oder dem Sinn nach entnommen wurden, sind kenntlich gemacht. Ich reiche die Arbeit erstmals als Prüfungsleistung ein.
  ]

  heading(level: 1, numbering: none, outlined: false)[Eidesstattliche Erklärung]

  if body != none { body } else { default-text }

  v(3cm)

  grid(
    columns: (1fr, 1fr),
    column-gutter: 2cm,
    row-gutter: 0.4em,
    [#line(length: 100%)],
    [#line(length: 100%)],
    [Berlin, #date],
    [#author],
  )
}