import pandas as pd

dados = pd.read_csv("dados/colaboradores.csv")

total_colaboradores = dados["id_colaborador"].nunique()
salario_medio = dados["salario"].mean()
tempo_medio = dados["tempo_empresa_anos"].mean()
desligamentos = (dados["situacao"] == "Desligado").mean() * 100
desempenho_medio = dados["avaliacao_desempenho"].mean()
satisfacao_media = dados["satisfacao"].mean()

print("ANÁLISE DE PEOPLE ANALYTICS")
print("-" * 35)

print(f"Total de colaboradores: {total_colaboradores}")
print(f"Salário médio: R$ {salario_medio:,.2f}")
print(f"Tempo médio de empresa: {tempo_medio:.2f} anos")
print(f"Taxa de desligamento: {desligamentos:.2f}%")
print(f"Avaliação média de desempenho: {desempenho_medio:.2f}")
print(f"Satisfação média: {satisfacao_media:.2f}")

print("\nColaboradores por departamento:")
print(dados.groupby("departamento")["id_colaborador"].count())

print("\nSalário médio por departamento:")
print(dados.groupby("departamento")["salario"].mean().round(2))

print("\nDesempenho médio por departamento:")
print(dados.groupby("departamento")["avaliacao_desempenho"].mean().round(2))

print("\nTaxa de desligamento por departamento:")
print(
    dados.groupby("departamento")["situacao"]
    .apply(lambda x: (x == "Desligado").mean() * 100)
    .round(2)
)
