import RouterPaths from "../../constants/RouterPaths";
import Article from "../../models/Article";
import { webview } from "@kit.ArkWeb";

@Builder
export function ArticleViewBuilder(name: string, param: Object) {
  ArticleView()
}

@Preview
@ComponentV2
struct ArticleView {
  pageInfos: NavPathStack = new NavPathStack();
  private webviewController: WebviewController = new webview.WebviewController()
  @Local article: Article = new Article()

  build() {
    NavDestination() {
      Web({
        src: this.article.link,
        controller: this.webviewController,
        renderMode: RenderMode.SYNC_RENDER
      })
    }
    .title(this.article.title)
    .onReady((context: NavDestinationContext) => {
      this.pageInfos = context.pathStack;
      this.article = this.pageInfos.getParamByName(RouterPaths.ArticleView).pop() as Article
    })
  }
}