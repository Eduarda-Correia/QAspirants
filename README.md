# Projeto de Testes Automatizados - ServeRest

Este repositório contém a automação de testes Web para a aplicação ServeRest (https://compassuolfront.serverest.dev/), como parte da atividade prática da Semana 14 do curso de Automação Web + AI.

## Objetivo

Automatizar casos de teste utilizando Robot Framework, aplicando boas práticas de código, versionamento e colaboração em equipe.

## Tecnologias

- Robot Framework
- Browser Library
- Python 3.x
- Git (Gitflow)

## Organização

- `main` → versão estável
- `develop` → integração para novas features
- `feature` → desenvolvimento de novas funcionalidades

## Estrutura

## 📁 Estrutura de Pastas

```plaintext
├── log/                   # Relatórios de execução
│   ├── log.html
│   ├── output.xml
│   ├── playwright-log.txt
│   └── report.html
│
├── serverest/
│   └── browser/screenshot/     # Screenshots dos testes
│
├── resources/             # Arquivos de recursos
│   ├── fixtures/          # Massa de dados
│   └── pages/             # Page Objects (POM)
│       └── components/    # Componentes reutilizáveis
│
├── tests/                 # Casos de teste organizados por funcionalidade
│   ├── products/
│   ├── shoppingList/
│   └── users/

