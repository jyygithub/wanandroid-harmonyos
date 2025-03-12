@Builder
export function PasswordViewBuilder(name: string, param: Object) {
  PasswordView()
}

@Preview
@ComponentV2
struct PasswordView {
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
    .title('修改密码')
    .backgroundColor($r('app.color.page'))
    .onReady((context: NavDestinationContext) => {
      this.pageInfos = context.pathStack;
    })
  }
}