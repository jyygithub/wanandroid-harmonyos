@Builder
export function CollectWebUrlViewBuilder(name: string, param: Object) {
  CollectWebUrlView()
}

@Preview
@ComponentV2
struct CollectWebUrlView {
  pageInfos: NavPathStack = new NavPathStack();

  build() {
    NavDestination() {

      Column({ space: 20 }) {
        TextInput({ placeholder: "网站名称" })
        TextArea({ placeholder: "链接地址" })
        Button("保存").width('100%')
      }
      .padding({ left: 16, right: 16 })
      .height('100%')

    }
    .height('100%')
    .width('100%')
    .title('收藏网站')
    .backgroundColor($r('app.color.page'))
    .onReady((context: NavDestinationContext) => {
      this.pageInfos = context.pathStack;
    })
  }
}