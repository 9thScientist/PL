@include "lib.awk"

BEGIN {
    trans = 0
    total_trans_path = "pages/total_trans.html"
    total_trans_title = "<h1>Todas as transações</h1>"
    trans_table_header = "<table> <tr> <th>Data Entrada</th> <th>Hora Entrada</th><th>Entrada</th><th>Data Saída</th> <th>Hora Saída</th> <th>Saída</th> <th>Importância</th> <th>Valor Desconto</th> <th>Taxa IVA</th> <th>Operador</th> <th>Tipo</th> <th>Data Débito</th> <th>Cartão</th>"

    print "<html>" header "<body>" total_trans_title "<ul>" > total_trans_path
    print trans_table_header > total_trans_path
}

match($0, /<TRANSACCAO>/, m) {
    trans++
}

match($0, /<(.*)>(.*)<\/.*>/, m) && trans {
    trans_info[++p] = m[2]
}

match($0, /<.*\/>/) && trans {
    trans_info[++p] = ""
}


match($0, /<\/TRANSACCAO>/, m) && trans {
    PROCINFO["sorted_in"] = "@ind_num_asc"
    for (desc in trans_info)
        trans_row_data = trans_row_data "<td>" trans_info[desc] "</td>"

    print "<tr>" trans_row_data "</tr>" > total_trans_path

    trans_row_data = ""
    delete_array(trans_info)
    trans = 0
    p = 0
    PROCINFO["sorted_in"] = std_sorted_in
}

END {
    print end_table > total_trans_path
    print "</ul>" back_link "</body></html>" > total_trans_path
}
