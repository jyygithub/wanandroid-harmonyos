import Coin from "../../models/Coin";
import CoinsViewModel from "../../viewmodels/CoinsViewModel";

@Builder
export function CoinsViewBuilder(name: string, param: Object) {
  CoinsView()
}

@Preview
@ComponentV2
struct CoinsView {

  @Local viewModel: CoinsViewModel = new CoinsViewModel();

  aboutToAppear(): void {
    this.viewModel.fetchCoins()
  }

  build() {
    NavDestination() {
      Refresh({ refreshing: this.viewModel.isRefreshing }) {
        List() {
          ForEach(this.viewModel.coins, (item: Coin) => {
            ListItem() {
              Column() {
                Text(item.username)
                Text(`${item.coinCount}`)
                Text(`${item.rank}`)
              }
            }
          })
        }
        .divider({ strokeWidth: 1 })
      }
      .onRefreshing(() => {
        this.viewModel.fetchCoins()
      })
    }
    .title("积分排行榜")
  }
}