import { ArticleCollectHistoryView } from "./collect/ArticleCollectHistoryView"
import { WebCollectHistoryView } from "./collect/WebCollectHistoryView"

@Builder
export function CollectHistoryViewBuilder(name: string, param: Object) {
  CollectHistoryView()
}

@Preview
@ComponentV2
struct CollectHistoryView {
  pageInfos: NavPathStack = new NavPathStack();

  build() {
    NavDestination() {
      Tabs({ barPosition: BarPosition.Start }) {
        TabContent() {
          ArticleCollectHistoryView({ pageInfos: this.pageInfos })
        }.tabBar("文章")

        TabContent() {
          WebCollectHistoryView({ pageInfos: this.pageInfos })
        }.tabBar("网址")

      }

    }
    .title("我的收藏")
    .onReady((context: NavDestinationContext) => {
      this.pageInfos = context.pathStack;
    })
  }
}