extension NameString on String {
  String getNameInitials() {
    if (isEmpty) return this;

    String nomeCompleto = this.trim();

    if (nomeCompleto.length == 2) return nomeCompleto.toUpperCase();
    if (!nomeCompleto.contains(" ") && nomeCompleto.length >= 2) return nomeCompleto.substring(0, 2).toUpperCase();

    List<String> nameArray = nomeCompleto.replaceAll(RegExp(r"\s+\b|\b\s"), " ").split(" ");

    String iniciais = ((nameArray[0])[0].isNotEmpty ? (nameArray[0])[0] : " ") + (nameArray.length == 1 ? " " : (nameArray[nameArray.length - 1])[0]);

    return iniciais;
  }
}