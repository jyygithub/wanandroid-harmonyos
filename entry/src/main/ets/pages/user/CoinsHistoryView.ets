@Builder
export function CoinsHistoryViewBuilder(name: string, param: Object) {
  CoinsHistoryView()
}

@Preview
@ComponentV2
struct CoinsHistoryView {
  build() {
    NavDestination() {

    }
    .title("我的积分")
  }
}