import { MyStorage } from "../../models/Storage";
import UserViewModel from "../../viewmodels/UserViewModel";
import { PersistenceV2 } from "@kit.ArkUI";

@Builder
export function UserViewBuilder(name: string, param: Object) {
  UserView()
}

@Preview
@ComponentV2
struct UserView {
  @Local storage: MyStorage = PersistenceV2.connect(MyStorage, () => new MyStorage())!;
  pageInfos: NavPathStack = new NavPathStack();
  @Local viewModel: UserViewModel = new UserViewModel()

  aboutToAppear(): void {
    this.viewModel.fetchTree(this.storage.cookies)
  }

  build() {
    NavDestination() {

      List() {
        ListItem() {
          Row() {
            Text("头像")
            Blank()
            Image($r('app.media.startIcon'))
              .width(60)
              .height(60)
          }
          .backgroundColor($r('app.color.row'))
          .width('100%')
          .padding(12)
          .borderRadius(10)
        }

        ListItem() {
          Row() {
            Text("昵称")
            Blank()
            Text(this.viewModel.user?.userInfo?.nickname)
          }
          .backgroundColor($r('app.color.row'))
          .width('100%')
          .padding(12)
          .margin({ top: 10 })
          .borderRadius({ topRight: 10, topLeft: 10 })
        }

        ListItem() {
          Row() {
            Text("邮箱")
            Blank()
            Text(this.viewModel.user?.userInfo?.email)
          }.backgroundColor($r('app.color.row')).width('100%').padding(12)
        }

        ListItem() {
          Row() {
            Text("用户名")
            Blank()
            Text(this.viewModel.user?.userInfo?.username)
          }.backgroundColor($r('app.color.row')).width('100%').padding(12)
          .borderRadius({ bottomLeft: 10, bottomRight: 10 })
        }

        ListItem() {
          Row() {
            Text("账号安全")
          }
          .backgroundColor($r('app.color.row'))
          .width('100%')
          .padding(12)
          .borderRadius(10)
          .margin({ top: 10 })
        }

        ListItem() {
          Button("退出登录")
            .onClick(() => {
              this.storage.cookies = ""
              this.pageInfos.pop()
            })
            .width('100%')
            .margin({ top: 10 })
        }
      }
      .padding({ left: 16, right: 16 })
      .divider({ strokeWidth: 1 })

    }
    .height('100%')
    .width('100%')
    .title('个人信息')
    .backgroundColor($r('app.color.page'))
    .onReady((context: NavDestinationContext) => {
      this.pageInfos = context.pathStack;
    })
  }
}