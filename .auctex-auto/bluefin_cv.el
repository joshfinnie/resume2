(TeX-add-style-hook
 "bluefin_cv"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "10pt" "letterpaper")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("parskip" "parfill") ("hyperref" "hidelinks" "unicode")))
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "href")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art10"
    "parskip"
    "array"
    "ifthen"
    "ragged2e"
    "fontawesome"
    "hyperref")
   (TeX-add-symbols
    '("twitter" 1)
    '("linkedin" 1)
    '("github" 1)
    '("homepage" 1)
    '("email" 1)
    '("phone" 1)
    '("lastname" 1)
    '("firstname" 1)
    '("name" 2)
    "namesize"
    "titlesize"
    "infoskip"
    "sectionlineskip"
    "nameskip"
    "sectionskip"
    "infoSep"
    "makeheader")
   (LaTeX-add-environments
    '("bfcvListSubsection" 0)
    '("bfcvProjSubsection" 2)
    '("bfcvItemlessWorkSubsection" 3)
    '("bfcvWorkSubsection" 3)
    '("bfcvSection" 1)))
 :latex)

