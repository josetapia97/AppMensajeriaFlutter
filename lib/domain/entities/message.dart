enum FromWho { me, his }

class Message {
  final String text;
  final String? imageUrl;
  final FromWho fromWho;
  //aqui tambien se puede añadir vistos, o hora de envio y hora de llegada

  Message({required this.text, this.imageUrl, required this.fromWho});
}
