@Builder
export function ReadHistoryViewBuilder(name: string, param: Object) {
  ReadHistoryView()
}

@Preview
@ComponentV2
struct ReadHistoryView {
  build() {
    NavDestination() {

    }
    .title("浏览历史")
  }
}