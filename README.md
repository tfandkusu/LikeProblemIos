# LikeProblemIos

Android と Flutter のいいね問題を解決したので、iOS のいいね問題を解決するプロジェクト

# これまでの経緯

## Android のいいね問題を解決

[Roomの更新監視の方法4種類を比較してみた](https://qiita.com/tfandkusu/items/672b2a043d27c0fefc89)

複数の画面のまたがるデータを SQLite データベースの ORMapper である [Room](https://developer.android.com/training/data-storage/room) に格納し、
[オブザーバブルクエリ](https://developer.android.com/training/data-storage/room/async-queries?hl=ja#observable)を使うことで、他の画面で行われた更新を抜けなく反映します。
ストレージに永続化されているので、プロセスキルからの復帰で途中の画面が復元されても対応可能です。

## Flutter のいいね問題を解決

[tfandkusu/flutter_architecture_sample](https://github.com/tfandkusu/flutter_architecture_sample)

複数の画面にまたがるデータを持つ [Riverpod](https://riverpod.dev/) の [StateNotifier](https://riverpod.dev/docs/providers/state_notifier_provider) に持たせて、画面固有の状態を持つ StateNotifier と Provider で合成したものを、画面の状態とします。

※ 2022年に設計したので、[現在の Riverpod の書き方](https://riverpod.dev/docs/migration/from_state_notifier)では無いです。

## 注意事項

いいね問題の解決方法は複数あり、今回紹介したやり方はその中の1例となります。
