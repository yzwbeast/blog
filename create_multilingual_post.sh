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
