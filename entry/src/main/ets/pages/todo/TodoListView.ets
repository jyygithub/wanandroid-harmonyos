import RouterPaths from "../../constants/RouterPaths";
import { DoneTodoListView } from "./status/DoneTodoListView";
import { UndoTodoListView } from "./status/UndoTodoListView";

@Builder
export function TodoListViewBuilder(name: string, param: Object) {
  TodoListView()
}

@Preview
@ComponentV2
struct TodoListView {
  pageInfos: NavPathStack = new NavPathStack();

  build() {
    NavDestination() {
      Tabs({ barPosition: BarPosition.Start }) {
        TabContent() {
          UndoTodoListView({ pageInfos: this.pageInfos })
        }.tabBar("未完成")

        TabContent() {
          DoneTodoListView({ pageInfos: this.pageInfos })
        }.tabBar("已完成")

      }
    }
    .height('100%')
    .width('100%')
    .title('我的待办')
    .backgroundColor($r('app.color.page'))
    .menus([{
      value: '新增',
      icon: $r('sys.media.ohos_ic_public_add'),
      action: () => {
        this.pageInfos.pushPathByName(RouterPaths.AddTodoView, null)
      }
    }])
    .onReady((context: NavDestinationContext) => {
      this.pageInfos = context.pathStack;
    })
  }
}