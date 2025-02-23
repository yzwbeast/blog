---
title: "Building My Blog: From Scratch to Online"
date: 2025-02-23
lang: "en"
draft: false
tags: [Blog Setup, Hugo, GitHub]
categories: []
---

# Hugo Blog + GitHub Pages Complete Deployment Guide

## 📌 Environment Preparation
- **Device**: MacBook (macOS)
- **Tools**:
  - Git
  - Hugo
  - GitHub Account

### **Install Hugo**
```sh
brew install hugo
```
Verify installation:
```sh
hugo version
```

## 🎯 Create Hugo Blog
```sh
mkdir blog && cd blog
hugo new site .
```
Initialize Git:
```sh
git init
```

## 🎨 Choose & Add Theme
Recommended `PaperMod` theme:
```sh
git submodule add https://github.com/adityatelange/hugo-PaperMod.git themes/PaperMod
```
Edit `config.toml`, add:
```toml
theme = "PaperMod"
baseURL = "https://yzwbeast.github.io/"
```

---

## 📝 Write Blog Posts
Create your first post:
```sh
hugo new posts/hello-world.md
```
Edit `content/posts/hello-world.md`:
```md
---
title: "Hello World"
date: 2025-02-22T12:00:00
draft: false
---

This is my first blog post!
```

---

## 🔧 Local Preview (Skip for First Deployment)
```sh
hugo server -D
```
Access in browser:
```
http://localhost:1313
```

---

## 🔥 Publish to GitHub
### **1. Create GitHub Repositories**
- `blog` (for Hugo source code)
- `yzwbeast.github.io` (for generated static files)

### **2. Push to `blog` Repository**
```sh
git remote add origin https://github.com/yzwbeast/blog.git
git branch -M main
git add .
git commit -m "Initial commit"
git push -u origin main
```

### **3. Generate Static Files**
```sh
hugo -D
```
Static files are located in the `public/` directory.

### **4. Push to `yzwbeast.github.io`**
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

## 🌎 Configure GitHub Pages
- Go to `yzwbeast.github.io` repository **Settings → Pages**.
- Select `main` branch, save and wait for deployment to complete.
- Visit `https://yzwbeast.github.io/` to view your blog.

---

## 🔄 Automated Deployment (Optional)
### **1. Add `deploy.sh` to `blog` Repository**
```sh
nano deploy.sh
```
Paste the following content:
```sh
#!/bin/bash
hugo -D
cd public
git add .
git commit -m "Deploy: $(date)"
git push origin main
cd ..
```
Save and exit (press `Ctrl + X`, then `Y`, and Enter).

### **2. Grant Execution Permission**
```sh
chmod +x deploy.sh
```

### **3. Run Deployment Script**
```sh
./deploy.sh
```


## 🎉 All Done!
To update your blog in the future:
1. Write posts in `blog/` directory: `hugo new posts/xxx.md`
2. Run `./deploy.sh`
3. Visit `https://yzwbeast.github.io/` to see updates

💡 **Refer back to this guide if you have any questions!** 🚀


## Hugo Blog Multi-language & Feature Expansion Guide

### [Quick Links](https://github.com/adityatelange/hugo-PaperMod/wiki/Features)

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

### **1. Directory Structure**
According to your `hugo.toml` configuration, your `content` directory structure should be:
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
Additionally, you need to create an `archetypes` directory to adapt to different languages:
```
archetypes/
  ├── default.md
  ├── zh.md
  ├── en.md
  ├── ja.md
```

### **2. `archetypes` Directory Configuration**
Each language's `archetypes` file is used to set default front matter.

#### **Default `archetypes/default.md`**
```yaml
---
title: "{{ replace .Name "-" " " | title }}"
date: {{ .Date }}
draft: true
tags: []
categories: []
---
```

#### **`archetypes/zh.md` (Chinese)**
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

#### **`archetypes/en.md` (English)**
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

#### **`archetypes/ja.md` (Japanese)**
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

### **3. Create Posts in Different Languages**
Use the `--kind` option to specify `archetypes` and create posts in the corresponding `content/` directory.

#### **Chinese Post**
```sh
hugo new content/zh/posts/my-first-post1.md
```
This will create `my-first-post.md` in the `content/zh/posts/` directory, using `archetypes/zh.md` as the template.

#### **English Post**
```sh
hugo new content/en/posts/my-first-post1.md
```
This will create `my-first-post.md` in the `content/en/posts/` directory, using `archetypes/en.md` as the template.

#### **Japanese Post**
```sh
hugo new content/ja/posts/my-first-post1.md
```
This will create `my-first-post.md` in the `content/ja/posts/` directory, using `archetypes/ja.md` as the template.

#### Automating the Creation of Articles in Different Languages

create_multilingual_post.sh Script
```bash
#!/bin/bash

# Check if the input parameter exists
if [ -z "$1" ]; then
    echo "Please enter the article title."
    exit 1
fi

TITLE="$1"
DATE=$(date +%Y-%m-%d)

# Create the article file name (using hyphens to separate words)
POST_NAME=$(echo "$TITLE" | tr " " "-")

# Generate the Chinese article
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
This is the Chinese version of the content.
EOL

# Generate the English article
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

# Generate the Japanese article
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
This is the Japanese version of the article.
EOL

echo "Successfully created articles in three languages: $TITLE"

```

In the terminal, first navigate to the directory where the script is located and grant execution permissions:
```bash
chmod +x create_multilingual_post.sh
```
Execute the following command and provide the article title:
```bash
./create_multilingual_post.sh "Your Article Title"
```

### **Summary**
- **Creating posts in different languages** requires `hugo new --kind <language> <path>`.
- **`archetypes` directory** should have `zh.md`, `en.md`, `ja.md` to match the `content/` directory.
- **Keep `contentDir` structure consistent** to avoid Hugo failing to find the correct template when generating posts.

Now you can correctly manage the creation of posts for a multi-language Hugo blog! 🚀