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

        }.tabBar("文章")

        TabContent() {

        }.tabBar("网址")

      }

    }
    .title("我的收藏")
  }
}