
@ComponentV2
export struct Course {
  pageInfos: NavPathStack = new NavPathStack();

  build() {
    NavDestination() {

    }
    .height('100%')
    .width('100%')
    .title('教程')
    .onReady((context: NavDestinationContext) => {
      this.pageInfos = context.pathStack;
    })
  }
}