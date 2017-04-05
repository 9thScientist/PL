@include "lib.awk"

BEGIN {
    cliente_path = "pages/cliente.html"
    cliente_title = "<h1>Informação do cliente</h1>"
    listing = "<li><b>%s:</b> %s</li>"

    print "<html>" header "<body>" cliente_title > cliente_path
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
    printf listing, "Nome", nome > cliente_path
    printf listing, "Nif", nif > cliente_path
    printf listing, "Morada", morada > cliente_path
    printf listing, "Localidade", localidade > cliente_path
    printf listing, "Codigo Postal", cp > cliente_path
}
