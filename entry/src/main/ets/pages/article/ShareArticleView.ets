@Builder
export function ShareArticleViewBuilder(name: string, param: Object) {
  ShareArticleView()
}

@Preview
@ComponentV2
struct ShareArticleView {
  pageInfos: NavPathStack = new NavPathStack();

  build() {
    NavDestination() {

      Column({ space: 20 }) {

        TextInput({ placeholder: "标题" })

        TextArea({ placeholder: "文章链接" })


      }
      .padding({ left: 16, right: 16 })
      .width('100%')
      .height('100%')

    }
    .height('100%')
    .width('100%')
    .title('分享文章')
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