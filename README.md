# Resns for iOS
## 概要
サービス「Re:sns」のiOSアプリケーションのリポジトリです。

## アプリケーションを初めて起動する際の注意点
Apolloで通信する初期ではBuild PhasesにあるGenerate Apollo GraphQLAPIの以下の設定をお願いします。

SCRIPT_PATH="${PODS_ROOT}/Apollo/scripts"
cd "${SRCROOT}/${TARGET_NAME}"
"${SCRIPT_PATH}"/run-bundled-codegen.sh codegen:generate --target=swift --includes=./**/*.graphql --localSchemaFile="schema.json" API.swift
#"${SCRIPT_PATH}"/run-bundled-codegen.sh schema:download --endpoint="https://backend-bff.herokuapp.com/query"


## アプリケーションのアーキテクチャについて
MVPと呼ばれるアーキテクチャを使用しています。
 
## 開発のルールやタスク管理
### ブランチ名について
ブランチ命名規則

develop 開発中のものを置くブランチ

master
master
release

次にリリースするものを置くブランチ

develop
master, develop
feature-*

新機能開発中に使うブランチ

develop
develop
hotfix-*

公開中のもののバグ修正用ブランチ

master
master, develop

Resns : Issuesと紐付けたブランチ命名

→ #1/develop


### レビュー体制
・最低2人のレビュー承認が必要(レビュアーの中には、PRを出したサービスのプラットフォームの別の人を必ず含む)
・ペアプロしてPR出した場合は、サービス外で最低2人のレビューが必要
・PRを出した人はmargeのボタンを押さないようにしよう
・PRの粒度は、WBSシートのスプリントバックログの機能ごとにする。

### コミットメッセージについて
コミットメッセージの先頭にはコミットの内容に応じて以下のような単語を頭につけてください  

add 新規ファイル(機能)の追加
[add]~~
fix

バグ修正
[fix]~~

update 機能修正（バグではないもの 処理速度、レイアウトなど)）
[update]~~
clean

整理（リファクタリング等）
[clean]~~
remove

ファイルの削除
[remove]~~
docs

ドキュメントの変更（README等）
[docs]~~
