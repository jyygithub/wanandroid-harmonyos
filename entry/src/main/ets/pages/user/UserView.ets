import UserViewModel from "../../viewmodels/UserViewModel";

@Builder
export function UserViewBuilder(name: string, param: Object) {
  UserView()
}

@Preview
@ComponentV2
struct UserView {
  pageInfos: NavPathStack = new NavPathStack();
  @Local viewModel: UserViewModel = new UserViewModel()

  aboutToAppear(): void {
    this.viewModel.fetchTree()
  }

  build() {
    NavDestination() {

      List() {
        ListItem() {
          Row() {
            Text("头像")
          }
        }

        ListItem() {
          Row() {
            Text("昵称")
            Text(this.viewModel.user?.userInfo?.nickname)
          }
        }

        ListItem() {
          Row() {
            Text("邮箱")
            Text(this.viewModel.user?.userInfo?.email)
          }
        }

        ListItem() {
          Row() {
            Text("用户名")
            Text(this.viewModel.user?.userInfo?.username)
          }
        }

        ListItem() {
          Row() {
            Text("账号安全")
          }
        }
      }

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