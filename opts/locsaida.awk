@include "lib.awk"

BEGIN {
    PROCINFO["sorted_in"] = "@ind_str_asc";

    header = "<head><meta charset='UTF-8'/><link rel='stylesheet' href='all.css'/></head>"
    back_link = "<p><i><a href='index.html'>Voltar</a></i></p>"

    locsaida_path = "pages/locsaida.html"
    locsaida_li = "<li>%s</li>\n"
    locsaida_title = "<h1>Locais de saída</h1>"

    print "<html>" header "<body>" locsaida_title "<ul>" > locsaida_path
}

match($0, /<SAIDA>(.*)<\/SAIDA>/, m) {
    !saidas[m[1]]++;
}

END {
    for (s in saidas)
        printf (locsaida_li, s) > locsaida_path

    print "</ul>" back_link "</body></html>" > locsaida_path
}
