@Builder
export function CoinsBuilder(name: string, param: Object) {
  Coins()
}

@Preview
@ComponentV2
struct Coins {
  build() {
    NavDestination() {

    }
    .title("积分排行榜")
  }
}