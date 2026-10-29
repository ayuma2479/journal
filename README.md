# journal

Flutterで作成した、投稿を検索・表示するアプリです。

## GitHub Pagesへの公開

`journal`という名前のリポジトリで公開する場合は、以下でWeb版をビルドします。

```sh
flutter build web --base-href /journal/
cp -R build/web/. docs/
touch docs/.nojekyll
```

`docs`と`pubspec.lock`の変更をコミットしてpushしたあと、GitHubの
Settings → Pagesで以下を設定します。

- Source: Deploy from a branch
- Branch: main
- Folder: /docs

Save後の公開先は `https://ayuma2479.github.io/journal/` です。
リポジトリ名が異なる場合は、ビルド時の`--base-href`と公開URLを変更してください。
