# 📋 Code Review - Squad 5

## ✅ Observações Gerais

* O projeto segue uma estrutura básica de **Page Object Model**, com arquivos resource separados para diferentes páginas — **boa prática**.
* Há uma separação clara entre arquivos de teste e arquivos resource.
* O projeto utiliza **fixtures** para os dados de teste, facilitando o gerenciamento de dados.

---

## 🛠️ Sugestões de Melhorias

### 📌 Seletores

* Alguns seletores CSS são muito complexos e podem quebrar com mudanças na UI, como:

  ```css
  css=h5.card-title.negrito:text("${nome_produto}") ~ div button[data-testid='adicionarNaLista']
  ```

  ➔ **Sugestão:** Utilizar seletores mais simples ou atributos `data-testid` sempre que possível.

### ⏱️ Timeout

* A variável global de timeout `${TIMEOUT}` está configurada para **2 segundos**, o que pode ser insuficiente para algumas operações.

  ➔ **Sugestão:** Ajustar o timeout de acordo com a necessidade real da aplicação.

### 🎲 Base de Dados

* Utilizar uma base de teste fixa para não sobrecarregar o banco de dados.
* Garantir **limpeza adequada** dos dados após a execução dos testes.

### 📁 Organização de Keywords

* Alguns testes **não utilizam argumentos estruturados por keywords**, o que dificulta a legibilidade e manutenção.

---

## 🔄 Fluxos de Teste

* Alguns testes **dependem de passos anteriores** e **não possuem um setup/teardown adequado**.

  ➔ **Sugestão:** Implementar fluxos de **setup** e **teardown** apropriados para garantir isolamento entre os testes.

* Criar um **repositório central de seletores** para facilitar a manutenção.

* Implementar um **Page Object Model mais estruturado**, com:

  * Separação clara de responsabilidades.
  * Objetos base para funcionalidades comuns.
  * **Testes mais atômicos**, focados em funcionalidades específicas.

---

## 🏁 Conclusão Final

Seguindo essas recomendações, o framework de automação de testes ficará:

* ✅ Mais robusto
* ✅ Mais fácil de manter
* ✅ Mais confiável

O foco deve ser:

* Garantir **isolamento dos testes**;
* Criar **assertivas mais significativas** para validação.

---
