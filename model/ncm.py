class Ncm:
    def __init__(self, codigo, descricao):
        self._codigo = codigo
        self._descricao = descricao

    @property
    def codigo(self):
        return self._codigo

    @property
    def descricao(self):
        return self._descricao;

    @codigo.setter
    def codigo(self, codigo):
        if codigo is not None and len(str(codigo)) == 8:
            self._codigo = codigo
            print(f'Ncm gravado')
        else:
            self._codigo = None
            print('Tamanho do ncm invalido!')
