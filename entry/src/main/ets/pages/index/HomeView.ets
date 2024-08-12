import RouterPaths from "../../constants/RouterPaths";
import Article from "../../models/Article";
import HomeViewModel from "../../viewmodels/HomeViewModel";
import { ArticleRow } from "../../views/ArticleRow";

@Preview
@ComponentV2
export struct HomeView {
  @Local viewModel: HomeViewModel = new HomeViewModel();
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
    .title("首页")
    .width('100%')
    .height('100%')
    .menus([{
      value: '搜索',
      icon: $r('app.media.app_icon'),
      action: () => {
        this.pageInfos.pushPathByName(RouterPaths.SearchView, null)
      }
    }])
  }
}