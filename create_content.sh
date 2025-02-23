#!/bin/bash

# 生成中文内容
mkdir -p content/zh
cat > content/zh/_index.md <<EOL
---
title: "你好，欢迎来到我的博客"
content: "这里是我的技术与生活分享"
lang: "zh"
---
EOL

cat > content/zh/about.md <<EOL
---
title: "关于我"
date: $(date)
lang: "zh"
draft: false
---
这里是关于我的内容，分享我的技术和生活。
EOL

mkdir -p content/zh/tags
cat > content/zh/tags/_index.md <<EOL
---
title: "标签"
lang: "zh"
---
这是所有标签的列表。
EOL

mkdir -p content/zh/categories
cat > content/zh/categories/_index.md <<EOL
---
title: "分类"
lang: "zh"
---
这是所有分类的列表。
EOL

# 生成英文内容
mkdir -p content/en
cat > content/en/_index.md <<EOL
---
title: "Hello, Welcome to my blog"
content: "This is my place to share tech & life"
lang: "en"
---
EOL

cat > content/en/about.md <<EOL
---
title: "About Me"
date: $(date)
lang: "en"
draft: false
---
This is where I share a bit about myself, my tech journey, and life.
EOL

mkdir -p content/en/tags
cat > content/en/tags/_index.md <<EOL
---
title: "Tags"
lang: "en"
---
This is the list of all tags.
EOL

mkdir -p content/en/categories
cat > content/en/categories/_index.md <<EOL
---
title: "Categories"
lang: "en"
---
This is the list of all categories.
EOL

# 生成日语内容
mkdir -p content/ja
cat > content/ja/_index.md <<EOL
---
title: "こんにちは、私のブログへようこそ"
content: "ここでは技術と生活について書きます"
lang: "ja"
---
EOL

cat > content/ja/about.md <<EOL
---
title: "私について"
date: $(date)
lang: "ja"
draft: false
---
これは私の自己紹介です。技術と生活に関することを書きます。
EOL

mkdir -p content/ja/tags
cat > content/ja/tags/_index.md <<EOL
---
title: "タグ"
lang: "ja"
---
これはすべてのタグのリストです。
EOL

mkdir -p content/ja/categories
cat > content/ja/categories/_index.md <<EOL
---
title: "カテゴリー"
lang: "ja"
---
これはすべてのカテゴリーのリストです。
EOL

echo "文件创建完成！"
