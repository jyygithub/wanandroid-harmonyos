import RouterPaths from "../../constants/RouterPaths";
import LoginViewModel from "../../viewmodels/LoginViewModel";

@Builder
export function LoginBuilder(name: string, param: Object) {
  Login()
}

@Preview
@ComponentV2
struct Login {
  pageInfos: NavPathStack = new NavPathStack();
  @Local viewModel: LoginViewModel = new LoginViewModel();
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
        Button("立即登录").width('100%')
          .onClick(() => {
            this.viewModel.login(
              this.email, this.password
            )
          })
        Button("注册账号").width('100%')
          .onClick(() => {
            this.pageInfos.pushPathByName(RouterPaths.Register, null)
          })
      }
      .padding(16)
    }
    .title("登录")
    .onReady((context: NavDestinationContext) => {
      this.pageInfos = context.pathStack;
    })
  }
}