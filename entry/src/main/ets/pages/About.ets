@Builder
export function AboutBuilder(name: string, param: Object) {
  About()
}

@Entry
@ComponentV2
struct About {
  pageInfos: NavPathStack = new NavPathStack();

  build() {
    NavDestination() {

    }
    .height('100%')
    .width('100%')
    .title('关于')
    .onReady((context: NavDestinationContext) => {
      this.pageInfos = context.pathStack;
    })
  }
}