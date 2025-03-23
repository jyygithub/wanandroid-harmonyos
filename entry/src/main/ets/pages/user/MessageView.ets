import { ReadedMessageView } from "./message/ReadedMessageView";
import { UnreadMessageView } from "./message/UnreadMessageView";

@Builder
export function MessageViewBuilder(name: string, param: Object) {
  MessageView()
}

@Preview
@ComponentV2
struct MessageView {
  pageInfos: NavPathStack = new NavPathStack();

  build() {
    NavDestination() {
      Tabs({ barPosition: BarPosition.Start }) {
        TabContent() {
          ReadedMessageView({ pageInfos: this.pageInfos })
        }.tabBar("已读")

        TabContent() {
          UnreadMessageView({ pageInfos: this.pageInfos })
        }.tabBar("未读")

      }
    }
    .height('100%')
    .width('100%')
    .title('消息')
    .backgroundColor($r('app.color.page'))
    .onReady((context: NavDestinationContext) => {
      this.pageInfos = context.pathStack;
    })
  }
}