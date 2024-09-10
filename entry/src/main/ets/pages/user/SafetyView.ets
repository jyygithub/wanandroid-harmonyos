@Builder
export function SafetyViewBuilder(name: string, param: Object) {
  SafetyView()
}

@Preview
@ComponentV2
struct SafetyView {
  pageInfos: NavPathStack = new NavPathStack();

  build() {
    NavDestination() {

      List() {
        ListItem(){
          Row() {
            Text("修改密码")
          }
        }
      }

    }
    .height('100%')
    .width('100%')
    .title('安全中心')
    .backgroundColor($r('app.color.page'))
    .onReady((context: NavDestinationContext) => {
      this.pageInfos = context.pathStack;
    })
  }
}