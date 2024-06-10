import RouterPaths from "../../constants/RouterPaths";
import Article from "../../models/Article";

@Builder
export function ArticleViewBuilder(name: string, param: Object) {
  ArticleView()
}

@Preview
@ComponentV2
struct ArticleView {
  pageInfos: NavPathStack = new NavPathStack();

  @Local article : Article = new Article()

  build() {
    NavDestination() {

    }
    .title(this.article.title)
    .onReady((context: NavDestinationContext) => {
      this.pageInfos = context.pathStack;
      this.article = this.pageInfos.getParamByName(RouterPaths.ArticleView).pop() as Article
    })
  }
}