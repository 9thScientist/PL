@include "lib.awk"
BEGIN {
    p = 0;
    PROCINFO["sorted_in"] = "@ind_str_asc";
    li = "<li>%s</li>\n"
    locsaida_p = "pages/locsaida.html"
    print "<p><i><a href='index.html'>Voltar</a></i></p>" > locsaida_p
}

match($0, /<SAIDA>(.*)<\/SAIDA>/, m) {
    !saida[m[1]]++;
}

END {
    for (loc in saida)
        printf li, loc > "pages/locsaida.html"
}
