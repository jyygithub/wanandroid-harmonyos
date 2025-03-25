import { MyStorage } from "../../../models/Storage";
import { PersistenceV2 } from "@kit.ArkUI";
import Message from "../../../models/Message";
import UnreadMessageViewModel from "../../../viewmodels/UnreadMessageViewModel";

@ComponentV2
export struct UnreadMessageView {
  @Local storage: MyStorage = PersistenceV2.connect(MyStorage, () => new MyStorage())!;
  @Local viewModel: UnreadMessageViewModel = new UnreadMessageViewModel()
  @Require @Param pageInfos: NavPathStack;

  aboutToAppear(): void {
    this.viewModel.fetchCoins(1,this.storage.cookies)
  }

  build() {
    NavDestination() {
      Refresh({ refreshing: this.viewModel.isRefreshing }) {
        List() {
          ForEach(this.viewModel.messages, (item: Message) => {
            ListItem() {
              Column() {
                Text(item.fromUser)
                Text(item.niceDate)
                Text(item.title)
                Text(item.message)
              }.width('100%')
            }
          })
        }
        .width('100%')
        .divider({ strokeWidth: 1 })
      }
      .onRefreshing(() => {
        this.viewModel.fetchCoins(1,this.storage.cookies)
      })
    }
    .height('100%')
    .width('100%')
    .backgroundColor($r('app.color.page'))
  }
}