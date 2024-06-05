@Builder
export function CoinsHistoryBuilder(name: string, param: Object) {
  CoinsHistory()
}

@Preview
@ComponentV2
struct CoinsHistory {
  build() {
    NavDestination() {

    }
    .title("我的积分")
  }
}