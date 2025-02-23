---
title: "我的博客搭建之旅：从零到上线"
date: 2025-02-23
lang: "zh"
draft: false
tags: [博客搭建,hugo,GitHub]
categories: []
---

# Hugo 博客 + GitHub Pages 完整部署方案

## 📌 环境准备
- **设备**：MacBook（macOS）
- **工具**：
  - Git
  - Hugo
  - GitHub 账号

### **安装 Hugo**
```sh
brew install hugo
```
确认安装成功：
```sh
hugo version
```

## 🎯 创建 Hugo 博客
```sh
mkdir blog && cd blog
hugo new site .
```
初始化 Git：
```sh
git init
```

## 🎨 选择 & 添加主题
推荐 `PaperMod` 主题：
```sh
git submodule add https://github.com/adityatelange/hugo-PaperMod.git themes/PaperMod
```
编辑 `config.toml`，添加：
```toml
theme = "PaperMod"
baseURL = "https://yzwbeast.github.io/"
```

---

## 📝 编写博客文章
创建第一篇文章：
```sh
hugo new posts/hello-world.md
```
编辑 `content/posts/hello-world.md`：
```md
---
title: "Hello World"
date: 2025-02-22T12:00:00
draft: false
---

这是我的第一篇博客！
```

---

## 🔧 本地预览（第一次部署请跳过）
```sh
hugo server -D
```
在浏览器访问：
```
http://localhost:1313
```

---

## 🔥 发布到 GitHub
### **1. 创建 GitHub 仓库**
- `blog`（存放 Hugo 源码）
- `yzwbeast.github.io`（存放生成的静态文件）

### **2. 推送 `blog` 仓库**
```sh
git remote add origin https://github.com/yzwbeast/blog.git
git branch -M main
git add .
git commit -m "Initial commit"
git push -u origin main
```

### **3. 生成静态文件**
```sh
hugo -D
```
静态文件位于 `public/` 目录。

### **4. 推送到 `yzwbeast.github.io`**
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

## 🌎 配置 GitHub Pages
- 进入 `yzwbeast.github.io` 仓库 **Settings → Pages**。
- 选择 `main` 分支，保存后等待部署完成。
- 访问 `https://yzwbeast.github.io/` 查看博客。

---

## 🔄 自动化部署（可选）
### **1. 在 `blog` 仓库添加 `deploy.sh`**
```sh
nano deploy.sh
```
粘贴以下内容：
```sh
#!/bin/bash
hugo -D
cd public
git add .
git commit -m "Deploy: $(date)"
git push origin main
cd ..
```
保存并退出（按 `Ctrl + X`，然后 `Y`，再回车）。

### **2. 赋予执行权限**
```sh
chmod +x deploy.sh
```

### **3. 运行部署脚本**
```sh
./deploy.sh
```


## 🎉 大功告成！
以后更新博客时，只需：
1. 在 `blog/` 目录下写文章 `hugo new posts/xxx.md`
2. 运行 `./deploy.sh`
3. 访问 `https://yzwbeast.github.io/` 查看更新

💡 **有问题随时复习此笔记！** 🚀


## Hugo 博客多语言 & 功能扩展指南
### [快速链接](https://github.com/adityatelange/hugo-PaperMod/wiki/Features)

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

### **1. 目录结构**
按照我的 `hugo.toml` 配置，我的 `content` 目录结构应该是：
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
同时，你需要创建 `archetypes` 目录来适配不同语言：
```
archetypes/
  ├── default.md
  ├── zh.md
  ├── en.md
  ├── ja.md
```

### **2. `archetypes` 目录配置**
每个语言的 `archetypes` 文件用于设置默认的 front matter。

#### **默认 `archetypes/default.md`**
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

#### **`archetypes/ja.md`（日语）**
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

### **3. 创建不同语言的文章**
使用 `--kind` 选项指定 `archetypes`，并将文章创建到对应的 `content/` 目录。

#### **中文文章**
```sh
hugo new content/zh/posts/my-first-post1.md
```
这会在 `content/zh/posts/` 目录下创建 `my-first-post.md`，并使用 `archetypes/zh.md` 作为模板。



#### **英文文章**
```sh
hugo new content/en/posts/my-first-post1.md
```
这会在 `content/en/posts/` 目录下创建 `my-first-post.md`，并使用 `archetypes/en.md` 作为模板。



#### **日语文章**
```sh
hugo new content/ja/posts/my-first-post1.md
```
这会在 `content/ja/posts/` 目录下创建 `my-first-post.md`，并使用 `archetypes/ja.md` 作为模板。

#### 自动化创建不同语言的文章

create_multilingual_post.sh 脚本
```bash
#!/bin/bash

# 检查传入参数是否存在
if [ -z "$1" ]; then
    echo "请输入文章标题。"
    exit 1
fi

TITLE="$1"
DATE=$(date +%Y-%m-%d)

# 创建文章文件名（使用短横线分隔）
POST_NAME=$(echo "$TITLE" | tr " " "-")

# 生成中文文章
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
这里是中文版本的内容。
EOL

# 生成英文文章
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

# 生成日语文章
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

echo "已成功创建三种语言版本的文章：$TITLE"

```

在终端中，先切换到脚本所在的目录，并授予执行权限：
```bash
chmod +x create_multilingual_post.sh
```
执行以下命令，并提供文章标题：
```bash
./create_multilingual_post.sh "你的文章标题"
```

### **总结**
- **创建不同语言的文章** 需要 `hugo new --kind <language> <path>`。
- **`archetypes` 目录** 应该有 `zh.md`、`en.md`、`ja.md` 以匹配 `content/` 目录。
- **保持 `contentDir` 结构一致**，避免 Hugo 生成文章时找不到正确的模板。

这样，你就可以正确管理 Hugo 多语言博客的文章创建了！🚀
