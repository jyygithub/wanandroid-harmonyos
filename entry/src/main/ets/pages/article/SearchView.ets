@Builder
export function SearchViewBuilder(name: string, param: Object) {
  SearchView()
}

@ComponentV2
export struct SearchView {

  build() {
    NavDestination() {

    }
    .height('100%')
    .width('100%')
    .title('搜索')
    .backgroundColor($r('app.color.page'))
  }
}