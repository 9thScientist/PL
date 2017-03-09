BEGIN {
    p = 0;
    PROCINFO["sorted_in"] = "@ind_str_asc";
}

match($0, /<SAIDA>(.*)<\/SAIDA>/, m) {
    !saida[m[1]]++;
}

END {
    for (loc in saida)
        print loc
}
