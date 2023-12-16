import Foundation
/**
 メンバー一覧をローカルメモリに格納する担当クラス
 */
class MemberLocalDataSource {
    /**
     初期値は空リスト
     */
    private var value = [Member]()

    /**
     AsyncStream の yield を呼ぶタスク
     */
    private var yieldTask = { (_: [Member]) in
    }

    /**
     AsyncStream でメンバー一覧を更新監視する
     */
    func getMembersAsAsyncStream() -> AsyncStream<[Member]> {
        return AsyncStream { continuation in
            // 現在の値を通知する
            continuation.yield(value)
            // 更新があったら通知する
            yieldTask = { newValue in
                continuation.yield(newValue)
            }
        }
    }

    /**
     新たなメインバー一覧を設定する
     */
    func setMembers(newValue: [Member]) {
        value = newValue
        yieldTask(value)
    }
}
