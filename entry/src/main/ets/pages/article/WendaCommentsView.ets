import RouterPaths from "../../constants/RouterPaths";
import Article from "../../models/Article";
import Course from "../../models/Course";
import CourseArticlesViewModel from "../../viewmodels/CourseArticlesViewModel";
import ProjectArticlesViewModel from "../../viewmodels/ProjectArticlesViewModel";
import ProjectsViewModel from "../../viewmodels/ProjectsViewModel";
import TreeArticlesViewModel from "../../viewmodels/TreeArticlesViewModel";
import WendaViewModel from "../../viewmodels/WendaViewModel";
import WxArticlesViewModel from "../../viewmodels/WxArticlesViewModel";
import { ArticleRow } from "../../views/ArticleRow";

@Builder
export function WendaCommentsViewBuilder(name: string, param: Object) {
  WendaCommentsView()
}

@Preview
@ComponentV2
export struct WendaCommentsView {
  @Local viewModel: WendaViewModel = new WendaViewModel();
  pageInfos: NavPathStack = new NavPathStack();

  aboutToAppear(): void {
    this.viewModel.fetchArticles(1)
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
        this.viewModel.fetchArticles(1)
      })
    }
    .backgroundColor($r('app.color.page'))
    .width('100%')
    .height('100%')
    .title("每日一问")
    .onReady((context: NavDestinationContext) => {
      this.pageInfos = context.pathStack;
    })
  }
}