import RouterPaths from "../../constants/RouterPaths";

@Builder
export function ShareHistoryViewBuilder(name: string, param: Object) {
  ShareHistoryView()
}

@Preview
@ComponentV2
struct ShareHistoryView {

  pageInfos: NavPathStack = new NavPathStack();

  build() {
    NavDestination() {

    }
    .title("我的分享")
    .menus([{
      value: '新增',
      icon: $r('sys.media.ohos_ic_public_add'),
      action: () => {
        this.pageInfos.pushPathByName(RouterPaths.ShareArticleView, null)
      }
    }])
    .onReady((context: NavDestinationContext) => {
      this.pageInfos = context.pathStack;
    })
  }
}