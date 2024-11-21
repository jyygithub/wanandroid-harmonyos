import RouterPaths from "../../constants/RouterPaths";
import Article from "../../models/Article";
import CourseArticlesViewModel from "../../viewmodels/CourseArticlesViewModel";
import ProjectsViewModel from "../../viewmodels/ProjectsViewModel";
import WxArticlesViewModel from "../../viewmodels/WxArticlesViewModel";
import { ArticleRow } from "../../views/ArticleRow";

@Builder
export function TreeArticlesViewBuilder(name: string, param: Object) {
  TreeArticlesView()
}

@Preview
@ComponentV2
export struct TreeArticlesView {
  @Local viewModel: CourseArticlesViewModel = new CourseArticlesViewModel();
  pageInfos: NavPathStack = new NavPathStack();

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

      })
    }
    .backgroundColor($r('app.color.page'))
    .width('100%')
    .height('100%')
    .title('体系文章')
    .onReady((context: NavDestinationContext) => {
      this.pageInfos = context.pathStack;
    })
  }
}