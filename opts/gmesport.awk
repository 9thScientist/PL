@include "lib.awk"

BEGIN {
    gmesport_path = "pages/gmesport.html"
    gmesport_title = "<h1>Gasto em portagens</h1>"

    print "<html>" header "<body>" gmesport_title gmes_table > gmesport_path
}

match($0, /<TIPO>(.*)<\/TIPO>/, m) && tolower(m[1]) == "portagens" {
    totalport[mes] += imp
    totalport_iva[mes] += imp * ("0." iva)
}

END {
    for (mes in totalport)
        printf table_tr_3, meshr(mes), totalport[mes], totalport_iva[mes] > gmesport_path

    print "</table>" back_link "</body></html>" > gmesport_path
}
