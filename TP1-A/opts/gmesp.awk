@include "lib.awk"

BEGIN {
    gmesp_path = "pages/gmesp.html"
    gmesp_title = "<h1>Gasto em parques</h1>"

    print "<html>" header "<body>" gmesp_title gmes_table > gmesp_path
}

match($0, /<TIPO>(.*)<\/TIPO>/, m) && tolower(m[1]) == "parques de estacionamento" {
    totalp[mes] += imp
    totalp_iva[mes] += imp * ("0." iva)
}

END {
    for (mes in totalp)
        printf table_tr_3, meshr(mes), totalp[mes], totalp_iva[mes] > gmesp_path

    print "</table>" back_link "</body></html>" > gmesp_path
}
