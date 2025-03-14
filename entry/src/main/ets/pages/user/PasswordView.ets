import { MyStorage } from "../../models/Storage";
import PasswordViewModel from "../../viewmodels/PasswordViewModel";
import { PersistenceV2 } from "@kit.ArkUI";

@Builder
export function PasswordViewBuilder(name: string, param: Object) {
  PasswordView()
}

@Preview
@ComponentV2
struct PasswordView {
  @Local storage: MyStorage = PersistenceV2.connect(MyStorage, () => new MyStorage())!;
  pageInfos: NavPathStack = new NavPathStack();
  @Local viewModel: PasswordViewModel = new PasswordViewModel()
  @Local oldPassword: string = ''
  @Local newPassword1: string = ''
  @Local newPassword2: string = ''

  build() {
    NavDestination() {

      Column({ space: 20 }) {

        TextInput({ placeholder: "输入原密码..." })
          .onChange((value) => {
            this.oldPassword = value
          })
        TextInput({ placeholder: "输入新密码..." })
          .onChange((value) => {
            this.newPassword1 = value
          })
        TextInput({ placeholder: "再次输入新密码..." })
          .onChange((value) => {
            this.newPassword2 = value
          })
        Button("保存").width('100%')
          .onClick(() => {
            this.viewModel.changePassword(this.oldPassword, this.newPassword1, this.newPassword1, this.storage.cookies)
          })
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