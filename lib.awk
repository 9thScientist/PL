BEGIN {
    system("mkdir -p pages");
    header = "<head><meta charset='UTF-8'/><link rel='stylesheet' href='all.css'/></head>"
    back_link = "<p><i><a href='index.html'>Voltar</a></i></p>"

    table_tr_3 = "<tr><td><b>%s:</b></td> <td> %s </td> <td> %s </td></tr>\n"
    table_tr_13 = "<tr> <td>%s</td> <td>%s</td> <td>%s</td> <td>%s</td> <td>%s</td> <td>%s</td> <td>%s</td> <td>%s</td> <td>%s</td> <td>%s</td> <td>%s</td> <td>%s</td> </tr>\n"
  }

function normalize(date) {
    split(date, d, "-", sp)
    return d[3] sp[1] d[2] sp[1] d[1]
}

function get_mes(date) {
    split(date, d, "-")
    return d[2]
}

function normFloat(float) {
    sub(/,/, ".", float)
    return float
}

function delete_array(array) {
    for (i in array)
        delete array[i]
}

function meshr(mes) {
    switch (mes) {
        case "01": return "Janeiro"
        case "02": return "Fevereiro"
        case "03": return "Março"
        case "04": return "Abril"
        case "05": return "Maio"
        case "06": return "Junho"
        case "07": return "Julho"
        case "08": return "Agosto"
        case "09": return "Setembro"
        case "10": return "Outubro"
        case "11": return "Novembro"
        case "12": return "Dezembro"
    }
}
