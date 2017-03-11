@include "lib.awk"
BEGIN {
    PROCINFO["sorted_in"] = "@ind_str_desc";
    fmt_dates = "<li><b>%s:</b> %s</li>\n"
    nentradas_p = "pages/nentradas.html"
    print "<p><i><a href='index.html'>Voltar</a></i></p>" > nentradas_p
}

match($0, /<DATA_ENTRADA>([^>]*)<\/DATA_ENTRADA>/, m) {
    dates[m[1]]++
}

END {
    for (date in dates)
        printf(fmt_dates, normalize(date), dates[date]) > nentradas_p
}
