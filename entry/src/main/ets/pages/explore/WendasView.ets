import RouterPaths from "../../constants/RouterPaths";
import Article from "../../models/Article";
import CirclesViewModel from "../../viewmodels/CirclesViewModel";
import { ArticleRow } from "../../views/ArticleRow";

@Preview
@ComponentV2
export struct WendasView {
  @Local viewModel: CirclesViewModel = new CirclesViewModel();
  @Require @Param pageInfos: NavPathStack;

  aboutToAppear(): void {
    this.viewModel.fetchArticles(0)
  }

  build() {
    NavDestination() {
      Refresh({ refreshing: this.viewModel.isRefreshing }) {
        List() {
          ForEach(this.viewModel.articles, (item: Article) => {
            ListItem() {
              ArticleRow({ article: item })
            }
            .onClick(() => {
              this.pageInfos.pushPathByName(RouterPaths.ArticleView, item)
            })
          })
        }
        .divider({ strokeWidth: 1 })
      }
      .onRefreshing(() => {
        this.viewModel.fetchArticles(0)
      })
    }
    .backgroundColor($r('app.color.page'))
    .width('100%')
    .height('100%')
  }
}