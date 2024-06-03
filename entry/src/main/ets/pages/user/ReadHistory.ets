@Builder
export function ReadHistoryBuilder(name: string, param: Object) {
  ReadHistory()
}

@Preview
@ComponentV2
struct ReadHistory {
  build() {
    NavDestination() {

    }
    .title("浏览历史")
  }
}