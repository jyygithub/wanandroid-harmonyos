import Article from "../../models/Article";
import HomeViewModel from "../../viewmodels/HomeViewModel";
import { ArticleRow } from "../../views/ArticleRow";

@Preview
@ComponentV2
export struct Home {
  @Local viewModel: HomeViewModel = new HomeViewModel();

  aboutToAppear(): void {
    this.viewModel.fetchArticles(0)
  }

  build() {
    NavDestination() {
      Refresh({ refreshing: this.viewModel.isRefreshing }) {
        List({ space: 1 }) {
          ForEach(this.viewModel.articles, (item: Article) => {
            ListItem() {
              ArticleRow({ article: item })
            }
          })
        }
        .padding({ left: 16, right: 16 })
      }
      .onRefreshing(() => {
        this.viewModel.fetchArticles(0)
      })
    }
    .backgroundColor($r('app.color.page'))
    .title("首页")
    .width('100%')
    .height('100%')
  }
}