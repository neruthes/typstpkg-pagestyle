#import "@preview/ose-pic:0.1.2": *
#show: ose-pic-init

#import "../src/pagestyle.typ": *



#set page(
  margin: (
    top: 36mm,
    bottom: 36mm,
    left: 25mm,
    right: 25mm,
  ),
)
#set text(size: 11pt, font: (
  "TeX Gyre Heros",
  "FreeSans",
  "Helvetica",
))
#set par(justify: true)
#set heading(numbering: "1.1.1.1.1.1.1.  ")
#show heading.where(depth: 1): it => {
  pagebreak(weak: true)
  block(spacing: 40mm, [
    #v(50mm)
    #thispagestyle("empty")
    #set text(size: 6mm, weight: 600)
    Chapter #counter(heading).get().first()

    #set text(size: 8mm, weight: 600)
    #it.body
  ])
}



// Footer page number
#AddToShipoutFGAll(context {
  getpagestyle(style_name => {
    if style_name == "plain" {
      place(top + center, dy: -1mm, box(inset: 25mm, [
        #h(1fr)
        #emph[
          Chapter #counter(heading).get().first();.
          #context query(selector(heading.where(depth: 1)).before(here())).last().body
        ]
      ]))
    }
    if style_name != "cover" {
      place(bottom + center, dy: 2mm, box(inset: 25mm, [
        #h(1fr)
        Page #counter(page).display()
      ]))
    }
  })
})


#pagestyle("plain")

#page([
  #thispagestyle("cover")
  #set text(weight: 600, size: 12mm)
  DEMO DOCUMENT \
  FOR PACKAGE \
  PAGESTYLE
])

= Hello World
#lorem(2500)

= Hallo Welt
#lorem(2500)

= Bonjour le Monde
#lorem(2500)


