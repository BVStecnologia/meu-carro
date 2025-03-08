# Meu Carro AI

Aplicativo para consulta de informações sobre veículos usando Supabase como backend.

## Como executar o projeto

1. Certifique-se de ter o Flutter instalado
2. Clone o repositório
3. Execute `flutter pub get` para instalar as dependências
4. Execute `flutter run -d chrome` para rodar o projeto no navegador

## Solução para o problema de login

Quando ocorrer o erro após fazer login e a aplicação fechar, siga estes passos:

1. O erro está relacionado a um problema na consulta ao Supabase, especificamente na forma como o aplicativo busca o histórico de consultas do usuário.

2. Localize o arquivo `/lib/consulta/consulta_widget.dart` e procure pelo seguinte código:

```dart
stream: _model.listViewSupabaseStream ??=
    SupaFlow.client
        .from("consultas")
        .stream(primaryKey: ['id_consulta'])
        .eqOrNull(
            'email',
            currentUserEmail,
        )
        .limit(10)
        .map((list) => list
            .map((item) => ConsultasRow(item))
            .toList()),
```

3. Substitua o método `eqOrNull` por `eq` para corrigir o problema:

```dart
stream: _model.listViewSupabaseStream ??=
    SupaFlow.client
        .from("consultas")
        .stream(primaryKey: ['id_consulta'])
        .eq(
            'email',
            currentUserEmail,
        )
        .limit(10)
        .map((list) => list
            .map((item) => ConsultasRow(item))
            .toList()),
```

4. O erro ocorre porque `eqOrNull` está tentando comparar uma string com um valor booleano, causando um erro no PostgreSQL: "argument of IS TRUE must be type boolean, not type character varying".

5. Após corrigir, execute novamente o aplicativo e o login deve funcionar normalmente, permitindo visualizar a tela de consulta.

## Funcionalidades

- Autenticação com e-mail e senha
- Autenticação com Google
- Consulta de informações sobre veículos
- Diferentes tipos de consulta: Básica, Restrições, Leilão, Roubo/Furto
- Histórico de consultas realizadas

## Estrutura do Projeto

O projeto segue a estrutura padrão do Flutter, com algumas particularidades:

- `/lib/auth/`: Contém a lógica de autenticação com Supabase
- `/lib/backend/`: Contém a lógica de comunicação com o Supabase
- `/lib/consulta/`, `/lib/veiculo_copy/`, etc.: Telas do aplicativo
- `/lib/flutter_flow/`: Componentes e utilidades do FlutterFlow

## Notas sobre o Supabase

O projeto usa Supabase para autenticação e armazenamento de dados. As seguintes tabelas são utilizadas:

- `usuarios`: Armazena informações dos usuários
- `consultas`: Armazena o histórico de consultas
- `veiculos`: Armazena informações sobre os veículos consultados

## Requisitos

- Flutter SDK: ">=3.0.0 <4.0.0"
- Principais dependências:
  - flutter_localizations
  - supabase_flutter: 2.6.0
  - go_router: 12.1.3
  - google_sign_in: 6.2.1