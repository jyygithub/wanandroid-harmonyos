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

        TextInput({ placeholder: "输入原密码..." })
        TextInput({ placeholder: "输入新密码..." })
        TextInput({ placeholder: "再次输入新密码..." })
        Button("保存").width('100%')
      }
      .height('100%')
      .padding({ left: 16, right: 16 })

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