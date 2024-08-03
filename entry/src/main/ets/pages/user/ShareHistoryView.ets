@Builder
export function ShareHistoryViewBuilder(name: string, param: Object) {
  ShareHistoryView()
}

@Preview
@ComponentV2
struct ShareHistoryView {
  build() {
    NavDestination() {

    }
    .title("我的分享")
  }
}