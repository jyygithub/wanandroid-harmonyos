import RouterPaths from "../../constants/RouterPaths";
import { MyStorage } from "../../models/Storage";
import LoginViewModel from "../../viewmodels/LoginViewModel";
import { PersistenceV2, promptAction } from "@kit.ArkUI";
import { rcp } from "@kit.RemoteCommunicationKit";
import { BusinessError } from "@kit.BasicServicesKit";
import { CookiesUtils } from "../../utils/CookiesUtils";

@Builder
export function LoginViewBuilder(name: string, param: Object) {
  LoginView()
}

@Preview
@ComponentV2
struct LoginView {
  @Local storage: MyStorage = PersistenceV2.connect(MyStorage, () => new MyStorage())!;
  pageInfos: NavPathStack = new NavPathStack();
  @Local viewModel: LoginViewModel = new LoginViewModel();
  @Local email: string = ''
  @Local password: string = ''

  login() {
    const getURL = `https://www.wanandroid.com/user/login`;
    const session = rcp.createSession({
      headers: {
        "Content-Type": "application/x-www-form-urlencoded"
      }
    });
    session.post(getURL, `username=${this.email}&password=${this.password}`).then((response) => {
      console.info(`Response succeeded: ${JSON.stringify(response.cookies)}`);
      console.info(`Response succeeded: ${JSON.stringify(response)}`);
      this.storage.cookies = CookiesUtils.formatWanAndroidCookies(response.cookies || [])
      console.info(`Response succeeded: ${CookiesUtils.formatWanAndroidCookies(response.cookies || [])}`);
      PersistenceV2.save(MyStorage);
      promptAction.showToast({ message: "登录成功" })
      this.pageInfos.pop()
    }).catch((err: BusinessError) => {
      console.error(`Response err: Code is ${JSON.stringify(err.code)}, message is ${JSON.stringify(err)}`);
    }).finally(() => {
      session.close()
    });
  }

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
            this.login()
          })
        Button("注册账号").width('100%')
          .onClick(() => {
            this.pageInfos.pushPathByName(RouterPaths.RegisterView, null)
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