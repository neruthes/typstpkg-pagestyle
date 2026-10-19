#import "@preview/ose-pic:0.1.2": *
#show: ose-pic-init

#import "../src/pagestyle.typ": *
#pagestyle("generic")


#set page(margin: (
  top: 44mm,
  bottom: 30mm,
  left: 30mm,
  right: 30mm,
))
#set heading(numbering: "1.1.1.1.1     ")
#set text(size: 11pt, font: (
  "TeX Gyre Heros",
))
#set par(justify: true)


#AddToShipoutBGAll({
  getpagestyle(sty => {
    {
      place(top + center, dy: -10mm, box(width: 100%, height: auto, inset: 30mm, {
        if sty == "generic" {
          context {
            let pnum = here().page()
            let cur = none
            for e in query(heading.where(level: 1)) {
              if e.location().page() <= pnum { cur = e }
            }
            if cur != none {
              let n = counter(heading).at(cur.location()).first()
              [#n. #cur.body]
            }
          }
        }
        h(1fr)
        if sty.starts-with("generic") {
          context counter(page).get().first() - 1
        }
        if sty == "generic" { block(width: 100%, height: 0.4pt, fill: gray) }
      }))
    }
  })
})

#let chapter(chap_name) = {
  pagebreak(weak: true)
  thispagestyle("generic_chapter")
  block(height: 10mm)
  heading(level: 1, chap_name)
  block(height: 20mm)
}


#let superlorem = { ((par(lorem(63)),) * 20).join() }





#page[
  #thispagestyle("empty")
  #set align(center + horizon)
  #set text(size: 9mm)
  YEMIANFENGGE \ (PAGESTYLE) \ DEMO DOC
  #v(30mm)

  #set text(size: 13pt)
  Version #toml("../src/typst.toml").package.version \
  Neruthes
  #v(10mm)
]





#chapter[First Chapter]
#superlorem

#chapter[Second Chapter]
#superlorem

#chapter[Third Chapter]
#superlorem

#chapter[Fourth Chapter]
#superlorem






#nextpagestyle("empty")

#pagebreak()
#v(1fr)
The last page is left empty.
