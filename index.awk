#!/usr/bin/gawk -f
@include "opts/nentradas.awk"
@include "opts/locsaida.awk"
@include "opts/gmes.awk"
@include "opts/gmesp.awk"

BEGIN {
    opts["nentradas"] = "Calcular o número de 'entradas' em cada dia do mês"
    opts["locsaida"] = "Escrever a lista de locaisde 'saída'"
    opts["gmes"] = "Calcular o total gasto no mês"
    opts["gmesp"] = "Calcular o total gasto no mês apenas em 'parques'"

    lnk = "<li><a href=%s>%s</a></li>"
    pth = "pages/"

    print_index()
}


function print_index() {
    for (i in opts)
        printf (lnk, pth i ".html" , opts[i]) > "index.html"
}
