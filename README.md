# 渡邊研卒論テンプレート

## TeXを使うメリット

- Wordを使うと、表示が崩れたときにどう対処していいかわからない
- 項目が増えたときに図や参考文献などの参照を1つずつ変える必要がある
- 基本的にはMarkdownから変換できるので、そんなに構えなくて良い

## 準備: macOS

- macOSのLaTeX環境には、MacTeXなどがあるが、全てのパッケージをインストールしてくれるため、とても容量が大きく、ダウンロードに時間がかかる。
- MacTeXを入れてもいいが、BasicTeXのインストールをオススメする。

### BasicTeXと日本語環境を入れる

```bash
$ brew cask install basictex

$ sudo tlmgr update --self --all
$ sudo tlmgr install collection-langjapanese
```

### ヒラギノフォントを使えるようにする

```bash
cd /usr/local/texlive/2016basic/texmf-dist/scripts/cjk-gs-integrate
sudo perl cjk-gs-integrate.pl --link-texmf
sudo mktexlsr
sudo updmap-sys --setoption kanjiEmbed hiragino-elcapitan-pron
```

### 必要なパッケージをインストール

tlmgrというのが、パッケージマネージャ的なやつ。

```bash
$ sudo tlmgr install titlesec setspace
```

### Markdownから変換する

```
$ brew install pandoc
```

### テンプレートのビルド(PDFの生成)

Makefileがあるので、基本的にこれを使えばOK。

```bash
$ make build
$ make open
$ make clean
```

まとめて書くこともできる。

```bash
$ make build open clean
```

Markdownから変換する場合はこれをbuildの前に追加する。

```bash
$ make convert
```

## 卒論を書く

- このリポジトリをForkして、Cloneする(Gitで管理することを推奨する)
- または、[Download Zip](https://github.com/keitalab/sotsuron-template-tex/archive/master.zip)
- body.texを編集する
- ビルドをする

## Q&A

- 表紙は?
    - 表紙あるとテンション上がりそうですが、面倒なのでWordで作るかPRください
- 游フォントを使いたいんだけど?
    - やり方を教えてください([参考](http://doratex.hatenablog.jp/entry/20151008/1444310306#27))
