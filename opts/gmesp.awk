@include "lib.awk"
@include "opts/gmes.awk"
BEGIN {
    PROCINFO["sorted_in"] = "@ind_str_asc"
    table = "<table><tr><th>Mês</th> <th>Total</th> <th>Total IVA</th>"
    end_table = "</table>"
    fmt = "<tr><td><b>%s:</b></td> <td> %s </td> <td> %s </td></tr>\n"
    gmesp_p = "pages/gmesp.html"

    print "<p><i><a href='index.html'>Voltar</a></i></p>" > gmesp_p
    print table > gmesp_p
}

match($0, /<TIPO>(.*)<\/TIPO>/, m) && tolower(m[1]) == "parques de estacionamento" {
    totalp[mes] += imp
    totalp_iva[mes] += imp * ("0." iva)
}


END {
    for (mes in totalp)
        printf fmt, meshr(mes), totalp[mes], totalp_iva[mes] > gmesp_p
}
