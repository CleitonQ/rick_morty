# 🛸 Rick & Morty - Flutter App

## 📌 Desafio

Desenvolvimento de um aplicativo Flutter para fãs da série **Rick & Morty**, consumindo a **Rick and Morty API (REST)**.  
O aplicativo tem como objetivo exibir uma lista de personagens e permitir a navegação para uma tela de detalhes de cada um,
com base em um protótipo de alta fidelidade fornecido pela **Kobe Apps**.

---

## 🧾 Descrição Geral

O objetivo deste projeto é criar um app móvel com Flutter que:

- Exibe uma lista de personagens da série Rick & Morty.
- Permite navegar para uma tela de **detalhes** de cada personagem.
- Mostra informações como:
    - Nome
    - Imagem
    - Status
    - Localização
    - Primeira aparição
    - E mais...

---

## ✅ Funcionalidades Obrigatórias

### 1. Lista de Personagens com Scroll
- Tela inicial com uma lista rolável.
- Cada item exibe o **nome** e a **imagem** do personagem.

### 2. Tela de Detalhes do Personagem
Ao clicar em um personagem, o app exibe:

- Nome
- Imagem
- Espécie
- Gênero
- Status
- Origem
- Última localização conhecida
- Primeira aparição

### 3. Navegação entre Telas
- Navegação fluida entre a lista e a tela de detalhes.

---

## ⚙️ Requisitos Técnicos

- **Tecnologia:** Flutter (Dart)
- **API:** [Rick and Morty API (REST)](https://rickandmortyapi.com/)
- **Responsividade:** Suporte a diversos tamanhos de tela
- **Design:** Baseado em Material Design

### 📚 Bibliotecas Utilizadas

- `http`: Requisições REST
- `google_fonts`: Fonte Lato
- `flutter`: Framework principal

---

## ✨ Funcionalidades Adicionais

- **🔄 Detalhes Dinâmicos:** Carregamento assíncrono via `FutureBuilder`
- **✅ Status do personagem:** A cor altera se o personagem for: Vivo, Morto ou Desconhecido

---

## 🧱 Arquitetura e Padrões

- **Componentes Reutilizáveis:** `AppBarWidget`, `CharacterCardWidget`, etc.
- **Chamadas Assíncronas:** `FutureBuilder`
- **Responsividade:** `MediaQuery`, `SingleChildScrollView`

---

## 📁 Estrutura do Projeto

```bash
lib/
├── components/                     # Widgets reutilizáveis
│   ├── app_bar_widget.dart         # AppBar superior nas telas
│   ├── character_card_widget.dart  # Card do personagem
│   └── ...                        
│
├── data/                          
│   ├── repository.dart             # Funções para buscar dados da API
│   └── ...                        
│
├── models/                        
│   ├── character_page.dart         # Tela de detalhes do personagem
│   ├── detailed_character.dart     # Modelo de dados do personagem
│   └── ...                        
│
├── pages/                         
│   ├── home_page.dart              # Tela inicial com a lista completa dos personagens
│   └── ...                        
│
├── theme/                         
│   ├── app_theme.dart              # Fontes e cores
│   └── ...                        
│
├── main.dart                       # Arquivo principal
└── pubspec.yaml                    # Dependências do projeto
```
---

## 📽 Demonstração

### 📺 Vídeo

Assista à demonstração do app via Google Drive:

[![Assistir Vídeo](https://img.shields.io/badge/📹%20Assistir%20o%20Vídeo%20no%20Google%20Drive-34A853?style=for-the-badge&logo=google-drive&logoColor=white)](https://drive.google.com/file/d/13jrz_OARBdJK6AX-2rTcqzoc5yRVcqUj/view?usp=drive_link)

---

### 🖼️ Imagens

Capturas de tela do aplicativo:

<img width="270" height="600" alt="Lista dos personagens" src="https://github.com/user-attachments/assets/27c1b718-881a-40de-bed3-22d12d73e923" />

<img width="270" height="600" alt="Detalhes do personagem" src="https://github.com/user-attachments/assets/771a2de7-d340-466e-b6e0-8dd795533294" />

---

## ▶️ Como Rodar o Projeto

### 📌 Pré-requisitos

- Editor de código (VS Code, Android Studio, etc.)
- Flutter instalado na sua máquina

### 🧭 Passos

1. **Clone o repositório:**

```bash
git clone https://github.com/CleitonQ/kode-start.git
```

2. **Acesse o diretório do projeto:**

```bash
cd kode-start
```

3. **Instale as dependências:**

```bash
flutter pub get
```

4. **Execute o aplicativo:**

```bash
flutter run
```
---

## 📇 Créditos

<p align="center">
  Desenvolvido com 💙 por <strong>Cleiton Queiroz</strong>
</p>

<p align="center">
  <a href="https://www.linkedin.com/in/cleitonqueiroz-dev" target="_blank">
    <img src="https://img.shields.io/badge/-LinkedIn-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white" alt="LinkedIn">
  </a>
  <a href="https://github.com/CleitonQ" target="_blank">
    <img src="https://img.shields.io/badge/-GitHub-181717?style=for-the-badge&logo=github&logoColor=white" alt="GitHub">
  </a>
  <a href="https://wa.me/5515996295847" target="_blank">
    <img src="https://img.shields.io/badge/-WhatsApp-25D366?style=for-the-badge&logo=whatsapp&logoColor=white" alt="WhatsApp">
  </a>
</p>
