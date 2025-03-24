import { MyStorage } from "../../../models/Storage";
import { PersistenceV2 } from "@kit.ArkUI";
import ReadedMessageViewModel from "../../../viewmodels/ReadedMessageViewModel";
import Message from "../../../models/Message";

@ComponentV2
export struct ReadedMessageView {
  @Local storage: MyStorage = PersistenceV2.connect(MyStorage, () => new MyStorage())!;
  @Local viewModel: ReadedMessageViewModel = new ReadedMessageViewModel()
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