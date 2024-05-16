@Builder
export function ShareHistoryBuilder(name: string, param: Object) {
  ShareHistory()
}

@Preview
@ComponentV2
struct ShareHistory {
  build() {
    NavDestination() {

    }
    .title("我的分享")
  }
}