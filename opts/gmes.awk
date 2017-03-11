@include "lib.awk"

BEGIN {
    PROCINFO["sorted_in"] = "@ind_str_asc"

    gmes_table = "<table><tr><th>Mês</th> <th>Total</th> <th>Total IVA</th>"
    gmes_path = "pages/gmes.html"
    gmes_title = "<h1>Gastos ao longo do mês</h1>"

    print "<html>" header "<body>" gmes_title gmes_table > gmes_path
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
        printf table_tr_3, meshr(mes), total[mes], total_iva[mes] > gmes_path

    print "</table>" back_link "</body></html>" > gmes_path
}
