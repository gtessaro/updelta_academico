class Transacao{
  final DateTime vencimento;
  final double valor;
  final String situacao;
  final int idBoleto;
  final String boletoNossoNumero;
  final String boletoDigitoVerificador;
  final int isBoletoLiberadoWeb;

  Transacao(this.vencimento,
            this.valor,
            this.situacao,
            this.idBoleto,
            this.boletoNossoNumero,
            this.boletoDigitoVerificador,
            this.isBoletoLiberadoWeb);

  factory Transacao.fromMap(Map<String, dynamic> json){
    return null;
  }

}