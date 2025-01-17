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
        Blank()
        Image($r('app.media.startIcon'))
          .width(80)
          .height(80)
        Text($r('app.string.app_name'))
          .fontWeight(FontWeight.Bold)
        Text("当前版本：0.1")
        Blank()
        Text('Github开源项目')
        Blank().height(20)
      }
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