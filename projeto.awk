BEGIN {
    PROCINFO["sorted_in"] = "@ind_str_desc";
    fmt = "%s -> %s\n"
}

match($0, /<DATA_ENTRADA>([^>]*)<\/DATA_ENTRADA>/, m) {
    dates[m[1]]++
}

END {
    for (date in dates)
        printf(fmt, normalize(date), dates[date])
}

function normalize(date) {
    split(date, d, "-", sp)
    return d[3] sp[1] d[2] sp[1] d[1]
}
