import Article from "../../models/Article";
import ExploreViewModel from "../../viewmodels/ExploreViewModel";
import { ArticleRow } from "../../views/ArticleRow";

@Preview
@ComponentV2
export struct Explore {
  @Local viewModel: ExploreViewModel = new ExploreViewModel();

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
      }
      .onRefreshing(() => {
        this.viewModel.fetchArticles(0)
      })
    }
    .title("探索")
    .width('100%')
    .height('100%')
  }
}