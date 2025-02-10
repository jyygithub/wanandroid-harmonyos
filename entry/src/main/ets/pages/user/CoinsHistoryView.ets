import { MyStorage } from "../../models/Storage";
import { PersistenceV2 } from "@kit.ArkUI";
import CoinsHistoryViewModel from "../../viewmodels/CoinsHistoryViewModel";
import CoinHistory from "../../models/CoinHistory";

@Builder
export function CoinsHistoryViewBuilder(name: string, param: Object) {
  CoinsHistoryView()
}

@Preview
@ComponentV2
struct CoinsHistoryView {
  @Local storage: MyStorage = PersistenceV2.connect(MyStorage, () => new MyStorage())!;
  @Local viewModel: CoinsHistoryViewModel = new CoinsHistoryViewModel();
  pageInfos: NavPathStack = new NavPathStack();

  aboutToAppear(): void {
    this.viewModel.fetchData(this.storage.cookies)
  }

  build() {
    NavDestination() {
      Refresh({ refreshing: this.viewModel.isRefreshing }) {
        List() {
          ForEach(this.viewModel.result, (item: CoinHistory) => {
            ListItem() {
              Text(item.desc)
            }
          })
        }
        .divider({ strokeWidth: 1 })
      }
      .onRefreshing(() => {
        this.viewModel.fetchData(this.storage.cookies)
      })
    }
    .title("我的积分")
    .onReady((context: NavDestinationContext) => {
      this.pageInfos = context.pathStack;
    })
  }
}