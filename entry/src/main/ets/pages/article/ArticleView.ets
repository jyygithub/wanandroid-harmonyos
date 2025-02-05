import RouterPaths from "../../constants/RouterPaths";
import Article from "../../models/Article";
import { webview } from "@kit.ArkWeb";
import ArticleViewModel from "../../viewmodels/ArticleViewModel";
import { MyStorage } from "../../models/Storage";
import { PersistenceV2 } from "@kit.ArkUI";

@Builder
export function ArticleViewBuilder(name: string, param: Object) {
  ArticleView()
}

@Preview
@ComponentV2
struct ArticleView {
  @Local storage: MyStorage = PersistenceV2.connect(MyStorage, () => new MyStorage())!;
  pageInfos: NavPathStack = new NavPathStack();
  private webviewController: WebviewController = new webview.WebviewController()
  @Local article: Article = new Article()
  @Local viewModel: ArticleViewModel = new ArticleViewModel()

  build() {
    NavDestination() {
      Web({
        src: this.article.link,
        controller: this.webviewController,
        renderMode: RenderMode.SYNC_RENDER
      })
    }
    .title(this.article.title)
    .menus([
      {
        value: '分享',
        icon: $r('sys.media.ohos_ic_public_share'),
        action: () => {

        }
      },
      {
        value: '浏览器打开',
        icon: $r('sys.media.ohos_ic_public_web'),
        action: () => {

        },

      },
      {
        value: '收藏',
        icon: $r('sys.media.ohos_ic_public_restore'),
        action: () => {
          this.viewModel.collect(this.article.id, this.storage.cookies)
        },

      }
    ])
    .onReady((context: NavDestinationContext) => {
      this.pageInfos = context.pathStack;
      this.article = this.pageInfos.getParamByName(RouterPaths.ArticleView).pop() as Article
    })
  }
}