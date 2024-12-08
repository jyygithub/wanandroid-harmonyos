import RouterPaths from "../../constants/RouterPaths";
import Article from "../../models/Article";
import Course from "../../models/Course";
import CourseArticlesViewModel from "../../viewmodels/CourseArticlesViewModel";
import ProjectArticlesViewModel from "../../viewmodels/ProjectArticlesViewModel";
import ProjectsViewModel from "../../viewmodels/ProjectsViewModel";
import TreeArticlesViewModel from "../../viewmodels/TreeArticlesViewModel";
import WxArticlesViewModel from "../../viewmodels/WxArticlesViewModel";
import { ArticleRow } from "../../views/ArticleRow";

@Builder
export function ProjectArticlesViewBuilder(name: string, param: Object) {
  ProjectArticlesView()
}

@Preview
@ComponentV2
export struct ProjectArticlesView {
  @Local viewModel: ProjectArticlesViewModel = new ProjectArticlesViewModel();
  pageInfos: NavPathStack = new NavPathStack();
  @Local title: string = ''

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
    .title(this.title)
    .onReady((context: NavDestinationContext) => {
      this.pageInfos = context.pathStack;
      let course = this.pageInfos.getParamByName(RouterPaths.ProjectArticlesView).pop() as Course
      this.title = course.name
      this.viewModel.fetchArticles(0, course.id)
    })
  }
}