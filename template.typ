// =============================================================
// template.typ
// Hauptlogik: setzt globale Styles, ruft Frontmatter-Module auf
// und schaltet Body zwischen Thesis (1-col) und Paper (2-col).
// =============================================================

#import "title-page.typ": tu-title-page
#import "abstracts.typ": abstract-page
#import "declaration.typ": declaration-page

#let tu-thesis(
  title: "",
  author: "",
  email: "",
  names: "",
  shorttitle: "",
  supervisor: "",
  doctype: "Master Thesis",
  date: datetime.today().display("[day].[month].[year]"),
  abstract-de: [],
  abstract-en: [],
  declaration-text: none,    // none -> Standardtext aus declaration.typ
  cols: 1,                   // 1 = Thesis (mit TOC), 2 = Paper (ohne TOC)
  col-gutter: 1em,
  body,
) = {
  // --- Document Metadata ---
  set document(title: title, author: author)

  // --- Mode-dependent settings (gelten erst im Body) ---
  let is-paper    = cols >= 2
  let body-size   = if is-paper { 10pt } else { 12pt }
  let margin-x    = if is-paper { 2cm } else { 3cm }
  let margin-t    = if is-paper { 2.5cm } else { 3cm }
  let margin-b    = if is-paper { 2.5cm } else { 3.7cm }
  let par-indent  = if is-paper { 1em } else { 0pt }

  // --- Front-matter base setup (immer Thesis-Stil) ---
  set page(
    paper: "a4",
    margin: (x: 3cm, top: 3cm, bottom: 3.7cm),
  )
  set text(font: "New Computer Modern", size: 12pt, lang: "de")
  set par(
    justify: true,
    leading: 0.7em,    // Zeilenabstand
    spacing: 1.2em,    // Absatzabstand
    first-line-indent: 0pt,
  )

  // --- Heading-Stil (em-basiert, skaliert mit Schriftgröße) ---
  set heading(numbering: "1.1")
  show heading: set text(font: "New Computer Modern", weight: "bold")
  show heading.where(level: 1): set text(size: 1.3em)
  show heading.where(level: 2): set text(size: 1.15em)
  // Größere Abstände um Sections herum
  show heading: set block(above: 1.8em, below: 1em)

  // --- TOC-Stil ---
  show outline.entry.where(level: 1): it => {
    v(1.2em)
    strong(it)
  }
  set outline(indent: auto)

  // --- Zitierstil ---
  set bibliography(style: "ieee")

  // --- Nummerierte Formeln ---
  set math.equation(numbering: "(1)")

  // ============= TITELSEITE =============
  tu-title-page(
    title: title,
    author: author,
    email: email,
    supervisor: supervisor,
    doctype: doctype,
    date: date,
  )

  // ============= FRONT MATTER (Numerierung i, ii, …) =============
  set page(numbering: "i")
  counter(page).update(2)

  if abstract-de != [] {
    abstract-page("Zusammenfassung", abstract-de)
    pagebreak()
  }

  if abstract-en != [] {
    abstract-page("Abstract", abstract-en)
    pagebreak()
  }

  declaration-page(
    author: author,
    date: date,
    body: declaration-text,
  )
  pagebreak()

  // TOC nur im Thesis-Modus
  if not is-paper {
    outline(title: [Inhaltsverzeichnis])
    pagebreak()
  }

  // ============= MAIN CONTENT (Numerierung 1, 2, …) =============
  // Settings ab hier gelten nur noch für den Body.
  set text(size: body-size)
  // leading + spacing kommen aus dem globalen set par oben.
  // Für Paper-Modus nur den Erstzeileneinzug anpassen.
  set par(first-line-indent: par-indent)
  set page(
    margin: (x: margin-x, top: margin-t, bottom: margin-b),
    numbering: "1",
    columns: cols,
    footer: none,
    header: context [
      #set text(size: 9pt, font: "New Computer Modern", style: "italic")
      #grid(
        columns: (1fr, 1fr),
        align: (left, right),
        [#names: #shorttitle],
        [#counter(page).display()]
      )
    ],
  )
  set columns(gutter: col-gutter)

  counter(page).update(1)

  // --- Komma als Dezimaltrennzeichen (nur im Body, damit Datums-
  //     angaben auf Titelseite/Frontmatter unangetastet bleiben).
  //     Bei Bedarf auskommentieren.
  show regex("\d+\.\d+"): it => {
    if it.func() != heading { show ".": "," }
    it
  }
  show math.equation: it => {
    show regex("\d+\.\d+"): it => {
      show ".": { "," + h(0pt) }
      it
    }
    it
  }

  body
}