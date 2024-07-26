import RouterPaths from "../../constants/RouterPaths";
import Article from "../../models/Article";
import HomeViewModel from "../../viewmodels/HomeViewModel";
import { ArticleRow } from "../../views/ArticleRow";

@Builder
export function ProjectsViewBuilder(name: string, param: Object) {
  ProjectsView()
}

@Preview
@ComponentV2
export struct ProjectsView {
  @Local viewModel: HomeViewModel = new HomeViewModel();
  pageInfos: NavPathStack = new NavPathStack();

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
    .title("项目")
    .width('100%')
    .height('100%')
  }
}