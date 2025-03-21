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
    .title('消息')
    .backgroundColor($r('app.color.page'))
    .onReady((context: NavDestinationContext) => {
      this.pageInfos = context.pathStack;
    })
  }
}