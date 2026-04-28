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
    Hiermit erkläre ich, dass ich die vorliegende Arbeit selbstständig
    verfasst und keine anderen als die angegebenen Quellen und Hilfsmittel
    benutzt sowie Zitate kenntlich gemacht habe. Die Arbeit wurde in dieser
    oder ähnlicher Form noch keiner anderen Prüfungsbehörde vorgelegt.
  ]

  heading(level: 1, numbering: none, outlined: false)[Eidesstattliche Erklärung]

  if body != none { body } else { default-text }

  v(3cm)

  // Unterschriftenblock: zwei nebeneinander stehende Linien mit
  // Beschriftung darunter (Ort/Datum links, Unterschrift rechts).
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