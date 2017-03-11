@include "lib.awk"
@include "opts/gmes.awk"
BEGIN {
    PROCINFO["sorted_in"] = "@ind_str_asc"
    gmesp_p = "pages/gmesp.html"

    print gmes_table > gmesp_p
}

match($0, /<TIPO>(.*)<\/TIPO>/, m) && tolower(m[1]) == "parques de estacionamento" {
    totalp[mes] += imp
    totalp_iva[mes] += imp * ("0." iva)
}


END {
    for (mes in totalp)
        printf table_tr_3, meshr(mes), totalp[mes], totalp_iva[mes] > gmesp_p
    print end_table > gmesp_p
    print back_link > gmesp_p
}
