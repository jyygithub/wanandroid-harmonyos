import { ArticleCollectHistoryView } from "./collect/ArticleCollectHistoryView"
import { WebCollectHistoryView } from "./collect/WebCollectHistoryView"

@Builder
export function CollectHistoryViewBuilder(name: string, param: Object) {
  CollectHistoryView()
}

@Preview
@ComponentV2
struct CollectHistoryView {
  build() {
    NavDestination() {
      Tabs({ barPosition: BarPosition.Start }) {
        TabContent() {
          ArticleCollectHistoryView()
        }.tabBar("文章")

        TabContent() {
          WebCollectHistoryView()
        }.tabBar("网址")

      }

    }
    .title("我的收藏")
  }
}