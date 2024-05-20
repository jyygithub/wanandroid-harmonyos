@Builder
export function ArticleBuilder(name: string, param: Object) {
  Article()
}

@Preview
@ComponentV2
struct Article {
  build() {
    NavDestination() {

    }
    .title("文章")
  }
}