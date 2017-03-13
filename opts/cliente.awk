cliente
@include "lib.awk"

BEGIN {
    cliente_path = "pages/cliente.html"
    cliente_title = "<h1>Informação do cliente</h1>"

    print "<html>" header "<body>" cliente_title gmes_table > cliente_path
}

match($0, /<Cliente id="(.*)">/, m) {
    id = m[1]
}


match($0, /<NIF>(.*)<\/NIF>/, m){
	nif = m[1]
}

match($0, /<NOME>(.*)<\/NOME>/, m){
	nome = m[1]
}

match($0, /<MORADA>(.*)<\/MORADA>/, m){
	morada = m[1]
}

match($0, /<LOCALIDADE>(.*)<\/LOCALIDADE>/, m){
	localidade = m[1]
}

match($0, /<CODIGO_POSTAL>(.*)<\/CODIGO_POSTAL>/, m){
	cp = m[1]
}

END {
        printf id, nif, nome, morada, localidade, cp
}
