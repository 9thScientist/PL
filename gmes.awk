BEGIN {
    PROCINFO["sorted_in"] = "@ind_str_asc"
    fmt = "%s -> %s\n"
}

match($0, /<DATA_SAIDA>(.*)<\/DATA_SAIDA>/, m) {
    mes = get_mes(m[1])
}

match($0, /<IMPORTANCIA>(.*)<\/IMPORTANCIA>/, m) {
    imp = m[1]
}

match($0, /<TAXA_IVA>(.*)<\/TAXA_IVA>/, m) {
    total[mes] += imp * m[1]
}

END {
    for (i in total)
        printf fmt, i, total[i]
}

function get_mes(date) {
    split(m[1], d, "-")
    return d[2]
}
