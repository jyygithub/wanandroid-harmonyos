import RouterPaths from "../../constants/RouterPaths";
import Article from "../../models/Article";
import ProjectsViewModel from "../../viewmodels/ProjectsViewModel";
import WxArticlesViewModel from "../../viewmodels/WxArticlesViewModel";
import { ArticleRow } from "../../views/ArticleRow";

@Preview
@ComponentV2
export struct WxAricleView {
  @Local viewModel: WxArticlesViewModel = new WxArticlesViewModel();
  @Require @Param pageInfos: NavPathStack;
  @Require @Param wxmpID: number;

  aboutToAppear(): void {
    this.viewModel.fetchArticles(0, this.wxmpID)
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