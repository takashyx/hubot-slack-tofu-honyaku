# 豆腐問題そろそろ解決してほしい。。。
MacからSlackクライアントを使って日本語の文章を投稿する際、日本語変換中にbackspace使ったりすると謎のバックスペース文字(U+0008)が入って文字化けすることが有ります。

![Pasted_Image_2017_08_23_15_14.png](https://qiita-image-store.s3.amazonaws.com/0/24956/fdc02dfb-88a1-a67d-db1e-fe721e451f7a.png)

# hubot-slack用スクリプト書きました。
Channelにbotをinviteしておくと、文字化け投稿を察知するとこんな感じで翻訳してくれます
node.jsのBufferを使っています

![Pasted_Image_2017_08_23_15_14.png](https://qiita-image-store.s3.amazonaws.com/0/24956/abed520f-619b-89e3-9fc1-ac857ee2021b.png)

# 問題の根幹
Slack Client が使っている electron が依存する Chromium の問題のようです

Backspace can not erase the last one character during Japanese IME conversion (macOS) · Issue #9173 · electron/electron
https://github.com/electron/electron/issues/9173

electronまでの修正は終わり、slack clientの取り込み待ち。
このスクリプトもそれまでの命でしょう。

# install
お手持ちのSlack用Hubotのルートディレクトリにて

```
npm install hubot-slack-tofu-honyaku --save
```

その後hubot-slack-tofu-honyakuをexternal-scripts.jsonに追加

```
$ cat external-scripts.json
[
  ... ,
  "hubot-slack-tofu-honyaku",
  ...
]
```

# リンク
## github
https://github.com/takashyx/hubot-slack-tofu-honyaku

## npm
https://www.npmjs.com/package/hubot-slack-tofu-honyaku
