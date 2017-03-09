BEGIN {
    PROCINFO["sorted_in"] = "@ind_str_asc"
    fmt = "%s -> %s\n"
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
    total[mes] += imp + imp * (iva / 100);
}


END {
    for (i in total)
        printf fmt, i, total[i]
}

function get_mes(date) {
    split(m[1], d, "-")
    return d[2]
}

function normFloat(float) {
    sub(/,/, ".", float)
    return float
}
