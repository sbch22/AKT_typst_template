// =============================================================
// abstracts.typ
// Eine Abstract-Seite (Titel + Body). Wird vom Template einmal
// für DE ("Zusammenfassung") und einmal für EN ("Abstract")
// aufgerufen.
// =============================================================

#let abstract-page(title, body) = {
  // Titel zentriert (typischer Abstract-Look), Body bleibt linksbündig/justified
  align(center, heading(level: 1, numbering: none, outlined: false)[#title])
  body
}