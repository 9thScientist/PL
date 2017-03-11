@include "lib.awk"
BEGIN {
    PROCINFO["sorted_in"] = "@ind_str_asc"
    table = "<table><tr><th>Mês</th> <th>Total</th> <th>Total IVA</th>"
    end_table = "</table>"
    fmt = "<tr><td><b>%s:</b></td> <td> %s </td> <td> %s </td></tr>\n"
    gmes_p = "pages/gmes.html"

    print "<p><i><a href='index.html'>Voltar</a></i></p>" > gmes_p
    print table > gmes_p
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

match($0, /<\/TRANSACCAO>/) {
    total[mes] += imp
    total_iva[mes] += imp * ("0." iva)
}

END {
    for (mes in total)
        printf fmt, meshr(mes), total[mes], total_iva[mes] > gmes_p

    print end_table > gmes_p
}
