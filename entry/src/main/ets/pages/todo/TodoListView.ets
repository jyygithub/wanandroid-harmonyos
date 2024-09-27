import RouterPaths from "../../constants/RouterPaths";

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

      Column({ space: 20 }) {
        Blank()
        Image($r('app.media.startIcon'))
          .width(80)
          .height(80)
        Text($r('app.string.app_name'))
          .fontWeight(FontWeight.Bold)
        Text("当前版本：0.1")
        Blank()
        Text('Github开源项目')
        Blank().height(20)
      }
      .height('100%')

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