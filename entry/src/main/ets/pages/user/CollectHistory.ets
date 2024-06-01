@Builder
export function CollectHistoryBuilder(name: string, param: Object) {
  CollectHistory()
}

@Preview
@ComponentV2
struct CollectHistory {
  build() {
    NavDestination() {

    }
    .title("我的收藏")
  }
}