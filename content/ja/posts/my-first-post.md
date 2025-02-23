---
title: "私のブログ構築の旅：ゼロからオンラインへ"
date: 2025-02-23
lang: "ja"
draft: false
tags: [ブログ構築, Hugo, GitHub]
categories: []
---

# Hugo ブログ + GitHub Pages 完全デプロイガイド

## 📌 環境準備
- **デバイス**：MacBook（macOS）
- **ツール**：
  - Git
  - Hugo
  - GitHub アカウント

### **Hugo のインストール**
```sh
brew install hugo
```
インストールの確認：
```sh
hugo version
```

## 🎯 Hugo ブログの作成
```sh
mkdir blog && cd blog
hugo new site .
```
Git の初期化：
```sh
git init
```


## 🎨 テーマの選択 & 追加
`PaperMod` テーマを推奨：
```sh
git submodule add https://github.com/adityatelange/hugo-PaperMod.git themes/PaperMod
```
`config.toml` を編集し、以下を追加：
```toml
theme = "PaperMod"
baseURL = "https://yzwbeast.github.io/"
```

---

## 📝 ブログ記事の作成
最初の記事を作成：
```sh
hugo new posts/hello-world.md
```
`content/posts/hello-world.md` を編集：
```md
---
title: "Hello World"
date: 2025-02-22T12:00:00
draft: false
---

これは私の最初のブログ記事です！
```

---

## 🔧 ローカルプレビュー（初回デプロイ時はスキップ）
```sh
hugo server -D
```
ブラウザでアクセス：
```
http://localhost:1313
```

---

## 🔥 GitHub への公開
### **1. GitHub リポジトリの作成**
- `blog`（Hugo ソースコード用）
- `yzwbeast.github.io`（生成された静的ファイル用）

### **2. `blog` リポジトリのプッシュ**
```sh
git remote add origin https://github.com/yzwbeast/blog.git
git branch -M main
git add .
git commit -m "Initial commit"
git push -u origin main
```

### **3. 静的ファイルの生成**
```sh
hugo -D
```
静的ファイルは `public/` ディレクトリにあります。

### **4. `yzwbeast.github.io` へのプッシュ**
```sh
cd public
git init
git remote add origin https://github.com/yzwbeast/yzwbeast.github.io.git
git checkout -b main
git add .
git commit -m "Deploy Hugo site"
git push -f origin main
```

---

## 🌎 GitHub Pages の設定
- `yzwbeast.github.io` リポジトリの **Settings → Pages** に移動。
- `main` ブランチを選択し、保存後デプロイ完了を待つ。
- `https://yzwbeast.github.io/` にアクセスしてブログを確認。

---

## 🔄 自動デプロイ（オプション）
### **1. `blog` リポジトリに `deploy.sh` を追加**
```sh
nano deploy.sh
```
以下を貼り付け：
```sh
#!/bin/bash
hugo -D
cd public
git add .
git commit -m "Deploy: $(date)"
git push origin main
cd ..
```
保存して終了（`Ctrl + X`、`Y`、Enter）。

### **2. 実行権限を付与**
```sh
chmod +x deploy.sh
```

### **3. デプロイスクリプトの実行**
```sh
./deploy.sh
```


## 🎉 完成！
以降のブログ更新は、以下の手順で行います：
1. `blog/` ディレクトリで記事を作成 `hugo new posts/xxx.md`
2. `./deploy.sh` を実行
3. `https://yzwbeast.github.io/` にアクセスして更新を確認

💡 **問題があればこのノートを参照してください！** 🚀


## Hugo ブログの多言語対応 & 機能拡張ガイド

### [クイックリンク](https://github.com/adityatelange/hugo-PaperMod/wiki/Features)

```toml
baseURL = "https://yzwbeast.github.io/"
title = "叶泽伟的博客"
theme = "PaperMod"
defaultContentLanguage = "zh"
hasCJKLanguage = true

[languages]
  [languages.zh]
    languageName = "中文"
    weight = 1
    contentDir = "content/zh"
    [languages.zh.params]
      archivesTitle = "归档"
      archivesDescription = "按年份和月份查看文章归档"
    [languages.zh.menu]
      [[languages.zh.menu.main]]
        name = "首页"
        url = "/"
        weight = 1
      [[languages.zh.menu.main]]
        name = "关于"
        url = "/about/"
        weight = 2
      [[languages.zh.menu.main]]
        name = "标签"
        url = "/tags/"
        weight = 3
      [[languages.zh.menu.main]]
        name = "归档"
        url = "/archives/"
        weight = 4
      [[languages.zh.menu.main]]
        name = "搜索"
        url = "/search/"
        weight = 5

  [languages.en]
    languageName = "English"
    weight = 2
    contentDir = "content/en"
    [languages.en.params]
      archivesTitle = "Archives"
      archivesDescription = "Browse articles by year and month"
    [languages.en.menu]
      [[languages.en.menu.main]]
        name = "Home"
        url = "/"
        weight = 1
      [[languages.en.menu.main]]
        name = "About"
        url = "/about/"
        weight = 2
      [[languages.en.menu.main]]
        name = "Tags"
        url = "/tags/"
        weight = 3
      [[languages.en.menu.main]]
        name = "Archives"
        url = "/archives/"
        weight = 4
      [[languages.en.menu.main]]
        name = "Search"
        url = "/search/"
        weight = 5

  [languages.ja]
    languageName = "日本語"
    weight = 3
    contentDir = "content/ja"
    [languages.ja.params]
      archivesTitle = "アーカイブ"
      archivesDescription = "年と月ごとに記事を表示"
    [languages.ja.menu]
      [[languages.ja.menu.main]]
        name = "ホーム"
        url = "/"
        weight = 1
      [[languages.ja.menu.main]]
        name = "について"
        url = "/about/"
        weight = 2
      [[languages.ja.menu.main]]
        name = "タグ"
        url = "/tags/"
        weight = 3
      [[languages.ja.menu.main]]
        name = "アーカイブ"
        url = "/archives/"
        weight = 4
      [[languages.ja.menu.main]]
        name = "検索"
        url = "/search/"
        weight = 5

[outputs]
  home = ["HTML", "RSS", "JSON", "SITEMAP"]
  section = ["HTML", "RSS"]
  archives = ["HTML"]
  search = ["HTML"]

[params]
  author = "叶泽伟"
  defaultTheme = "auto"
  ShowAllPagesInArchive = true
  ShowShareButtons = true
  ShowReadingTime = true
  ShowToc = true
  TocOpen = false
  ShowBreadCrumbs = true
  ShowCodeCopyButtons = true
  ShowPostNavLinks = true
  ShowRssButtonInSectionTermList = true
  archives = true
  [params.fuseOpts]
    isCaseSensitive = false
    shouldSort = true
    location = 0
    distance = 1_000
    threshold = 0.4
    minMatchCharLength = 0
    keys = [ "title", "permalink", "summary", "content" ]


[content]
  archivesDir = "content/archives"
```

### **1. ディレクトリ構造**
`hugo.toml` の設定に従い、`content` ディレクトリの構造は以下のようになります：
```
content/
  ├── zh/
  │   ├── _index.md
  │   ├── about.md
  │   ├── archives.md
  │   ├── search.md
  │   ├── categories/_index.md
  │   ├── posts/_index.md
  │   ├── tags/_index.md
  ├── en/
  │   ├── _index.md
  │   ├── about.md
  │   ├── archives.md
  │   ├── search.md
  │   ├── categories/_index.md
  │   ├── posts/_index.md
  │   ├── tags/_index.md
  ├── ja/
      ├── _index.md
      ├── about.md
      ├── archives.md
      ├── search.md
      ├── categories/_index.md
      ├── posts/_index.md
      ├── tags/_index.md
```
また、`archetypes` ディレクトリを作成し、各言語に対応させます：
```
archetypes/
  ├── default.md
  ├── zh.md
  ├── en.md
  ├── ja.md
```


### **2. `archetypes` ディレクトリの設定**
各言語の `archetypes` ファイルは、デフォルトの front matter を設定するために使用されます。

#### **デフォルト `archetypes/default.md`**
```yaml
---
title: "{{ replace .Name "-" " " | title }}"
date: {{ .Date }}
draft: true
tags: []
categories: []
---
```

#### **`archetypes/zh.md`（中文）**
```yaml
---
title: "{{ replace .Name "-" " " | title }}"
date: {{ .Date }}
draft: true
tags: []
categories: []
lang: "zh"
---
```

#### **`archetypes/en.md`（英文）**
```yaml
---
title: "{{ replace .Name "-" " " | title }}"
date: {{ .Date }}
draft: true
tags: []
categories: []
lang: "en"
---
```

#### **`archetypes/ja.md`（日本語）**
```yaml
---
title: "{{ replace .Name "-" " " | title }}"
date: {{ .Date }}
draft: true
tags: []
categories: []
lang: "ja"
---
```

### **3. 各言語の記事作成**
`--kind` オプションを使用して `archetypes` を指定し、対応する `content/` ディレクトリに記事を作成します。

#### **中文記事**
```sh
hugo new content/zh/posts/my-first-post1.md
```
これにより、`content/zh/posts/` ディレクトリに `my-first-post.md` が作成され、`archetypes/zh.md` がテンプレートとして使用されます。

#### **英文記事**
```sh
hugo new content/en/posts/my-first-post1.md
```
これにより、`content/en/posts/` ディレクトリに `my-first-post.md` が作成され、`archetypes/en.md` がテンプレートとして使用されます。

#### **日本語記事**
```sh
hugo new content/ja/posts/my-first-post1.md
```
これにより、`content/ja/posts/` ディレクトリに `my-first-post.md` が作成され、`archetypes/ja.md` がテンプレートとして使用されます。

#### 自動化による多言語記事の作成

create_multilingual_post.sh スクリプト
```bash
#!/bin/bash

# 入力パラメータが存在するか確認
if [ -z "$1" ]; then
    echo "記事のタイトルを入力してください。"
    exit 1
fi

TITLE="$1"
DATE=$(date +%Y-%m-%d)

# 記事のファイル名を作成（単語をハイフンで区切る）
POST_NAME=$(echo "$TITLE" | tr " " "-")

# 中国語の記事を生成
mkdir -p "content/zh/posts"
cat > "content/zh/posts/$POST_NAME.md" <<EOL
---
title: "$TITLE"
date: $DATE
lang: "zh"
draft: true
tags: []
categories: []
---
ここは中国語バージョンの内容です。
EOL

# 英語の記事を生成
mkdir -p "content/en/posts"
cat > "content/en/posts/$POST_NAME.md" <<EOL
---
title: "$TITLE"
date: $DATE
lang: "en"
draft: true
tags: []
categories: []
---
This is the English version of the post.
EOL

# 日本語の記事を生成
mkdir -p "content/ja/posts"
cat > "content/ja/posts/$POST_NAME.md" <<EOL
---
title: "$TITLE"
date: $DATE
lang: "ja"
draft: true
tags: []
categories: []
---
この記事は日本語バージョンです。
EOL

echo "3つの言語バージョンの記事が正常に作成されました：$TITLE"

```

ターミナルで、まずスクリプトが存在するディレクトリに移動し、実行権限を付与します：
```bash
chmod +x create_multilingual_post.sh
```
以下のコマンドを実行し、記事のタイトルを指定します：
```bash
./create_multilingual_post.sh "あなたの記事タイトル"
```

### **まとめ**
- **各言語の記事を作成する** には、`hugo new --kind <language> <path>` を使用します。
- **`archetypes` ディレクトリ** には、`zh.md`、`en.md`、`ja.md` を用意し、`content/` ディレクトリと対応させます。
- **`contentDir` の構造を一貫させる** ことで、Hugo が記事を生成する際に正しいテンプレートを見つけられるようにします。

これで、Hugo の多言語ブログの記事作成を正しく管理できるようになります！🚀