from model import ncm, cfop

print(f'Iniciando Projeto PCustos 10/10/2021')

ncm = ncm.Ncm(33045590, 'Descricao Teste 1')
print(f'o codigo ncm do produto e: {ncm.codigo}')
print(f'A descricao do ncm do produto e: {ncm.descricao}')

ncm.codigo = 330566579

print(f'Novo ncm gravado e {ncm.codigo}')

cfop = cfop.Cfop(5202, 'Codigo cfop')
print(f'{cfop.codigo} - {cfop.descricao}')
