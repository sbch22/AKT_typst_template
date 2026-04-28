// =============================================================
// title-page.typ
// TU Berlin Titelseite — wird in beiden Modi (1-col / 2-col)
// gleich gerendert.
// =============================================================

#let tu-title-page(
  title: "",
  author: "",
  email: "",
  supervisor: "",
  doctype: "Master Thesis",
  date: datetime.today().display("[day].[month].[year]"),
) = {
  page(numbering: none)[
    #set align(center)
    #set text(font: "New Computer Modern")

    #text(size: 1.4em, weight: "bold")[Technische Universität Berlin]

    #v(0.7cm)
    #text(size: 1.1em)[Fachgebiet Audiokommunikation]

    #v(0.7cm)
    Fakultät I \
    Einsteinufer 17 \
    10587 Berlin

    #v(2.5cm)

    #image("logos/TU_Logo_kurz_RGB_rot-eps-converted-to.pdf", height: 4cm)

    #v(2.5cm)

    #block(text(size: 1.4em, weight: "bold", title))

    #v(0.7cm)
    #text(size: 1.1em)[#doctype]

    #v(0.8cm)

    #author \
    #if email != "" {
      link("mailto:" + email)[#text[#email]]
    }

    #v(0.6cm)

    Betreut von: \
    #supervisor

    #v(1fr)

    Berlin, #date
  ]
}