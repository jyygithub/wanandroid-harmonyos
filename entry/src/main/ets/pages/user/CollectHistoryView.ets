@Builder
export function CollectHistoryViewBuilder(name: string, param: Object) {
  CollectHistoryView()
}

@Preview
@ComponentV2
struct CollectHistoryView {
  build() {
    NavDestination() {

    }
    .title("我的收藏")
  }
}