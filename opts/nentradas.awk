@include "lib.awk"

BEGIN {
    PROCINFO["sorted_in"] = "@ind_str_desc";

    header = "<head><meta charset='UTF-8'/><link rel='stylesheet' href='all.css'/></head>"
    back_link = "<p><i><a href='index.html'>Voltar</a></i></p>"

    nentradas_path = "pages/nentradas.html"
    entradas_fmt = "<tr><td>%s</td><td class='bar' style='width: %s'>%s</td>"
    entradas_title = "<h1>Número de entradas durante o mês</h1>"

    print "<html>" header "<body>" entradas_title "<table>" > nentradas_path
}

match($0, /<DATA_ENTRADA>([^>]*)<\/DATA_ENTRADA>/, m) {
    dates[m[1]]++
}

END {
    for (date in dates)
        printf(entradas_fmt, normalize(date), dates[date]*25, dates[date]) > nentradas_path

    print "</table>" back_link "</body></html>" > nentradas_path
}
