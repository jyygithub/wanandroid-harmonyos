import RegisterViewModel from "../../viewmodels/RegisterViewModel";

@Builder
export function RegisterBuilder(name: string, param: Object) {
  Register()
}

@Preview
@ComponentV2
struct Register {
  pageInfos: NavPathStack = new NavPathStack();

  @Local viewModel: RegisterViewModel = new RegisterViewModel();
  @Local email: string = ''
  @Local password: string = ''

  build() {
    NavDestination() {
      Column({ space: 10 }) {
        TextInput({ placeholder: "邮箱" })
          .onChange((value) => {
            this.email = value
          })
        TextInput({ placeholder: "密码" })
          .onChange((value) => {
            this.password = value
          })
        Button("立即注册").width('100%')
          .onClick(() => {
            this.viewModel.register(
              this.email, this.password
            )
          })
      }
      .padding(16)
    }
    .title("注册")
    .onReady((context: NavDestinationContext) => {
      this.pageInfos = context.pathStack;
    })
  }
}