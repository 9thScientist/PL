@include "lib.awk"
BEGIN {
    PROCINFO["sorted_in"] = "@ind_str_asc"
    fmt = "<li><b>%s:</b> %s</li>\n"
    gmesp_p = "pages/gmesp.html"
    print "<p><i><a href='index.html'>Voltar</a></i></p>" > gmesp_p
}

match($0, /<DATA_SAIDA>(.*)<\/DATA_SAIDA>/, m) {
    mes = get_mes(m[1])
}

match($0, /<IMPORTANCIA>(.*)<\/IMPORTANCIA>/, m) {
    imp = normFloat(m[1])
}

match($0, /<TAXA_IVA>(.*)<\/TAXA_IVA>/, m) {
    iva = m[1]
}

match($0, /<TIPO>(.*)<\/TIPO>/, m) && tolower(m[1]) == "parques de estacionamento" {
    totalp[mes] += imp + imp * (iva / 100);
}


END {
    for (i in totalp)
        printf fmt, meshr(i), totalp[i] > "pages/gmesp.html"
}
