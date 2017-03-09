function normalize(date) {
    split(date, d, "-", sp)
    return d[3] sp[1] d[2] sp[1] d[1]
}

function get_mes(date) {
    split(m[1], d, "-")
    return d[2]
}

function normFloat(float) {
    sub(/,/, ".", float)
    return float
}
