@Builder
export function CollectArticleUrlViewBuilder(name: string, param: Object) {
  CollectArticleUrlView()
}

@Preview
@ComponentV2
struct CollectArticleUrlView {
  pageInfos: NavPathStack = new NavPathStack();

  build() {
    NavDestination() {

      Column({ space: 20 }) {
        TextInput({ placeholder: "文章标题" })
        TextInput({ placeholder: "文章作者" })
        TextArea({ placeholder: "链接地址" })
        Button("保存").width('100%')
      }
      .padding({ left: 16, right: 16 })
      .height('100%')

    }
    .height('100%')
    .width('100%')
    .title('收藏文章')
    .backgroundColor($r('app.color.page'))
    .onReady((context: NavDestinationContext) => {
      this.pageInfos = context.pathStack;
    })
  }
}