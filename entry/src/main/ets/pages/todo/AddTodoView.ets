@Builder
export function AddTodoViewBuilder(name: string, param: Object) {
  AddTodoView()
}

@Preview
@ComponentV2
struct AddTodoView {
  pageInfos: NavPathStack = new NavPathStack();

  build() {
    NavDestination() {

      Column({ space: 20 }) {

        TextInput()

        TextArea()
          .height(500)

      }
      .padding({ left: 16, right: 16 })
      .width('100%')
      .height('100%')

    }
    .height('100%')
    .width('100%')
    .title('新增待办')
    .backgroundColor($r('app.color.page'))
    .menus([{
      value: '提交',
      icon: $r('sys.media.ohos_ic_public_ok'),
      action: () => {

      }
    }])
    .onReady((context: NavDestinationContext) => {
      this.pageInfos = context.pathStack;
    })
  }
}