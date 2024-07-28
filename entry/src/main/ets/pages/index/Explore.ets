import RouterPaths from "../../constants/RouterPaths";
import Article from "../../models/Article";
import ExploreViewModel from "../../viewmodels/ExploreViewModel";
import { ArticleRow } from "../../views/ArticleRow";
import { CirclesView } from "../explore/CirclesView";
import { ProjectsView } from "../explore/ProjectsView";

@Preview
@ComponentV2
export struct Explore {
  @Local viewModel: ExploreViewModel = new ExploreViewModel();
  @Require @Param pageInfos: NavPathStack;

  aboutToAppear(): void {
    this.viewModel.fetchArticles(0)
  }

  build() {
    NavDestination() {
      Refresh({ refreshing: this.viewModel.isRefreshing }) {
        Column() {
          Tabs({ barPosition: BarPosition.Start }) {
            TabContent() {
              ProjectsView({ pageInfos: this.pageInfos })
            }.tabBar("项目")

            TabContent() {
              CirclesView({ pageInfos: this.pageInfos })
            }.tabBar("广场")

            TabContent() {
              Column().width('100%').height('100%').backgroundColor(Color.Blue)
            }.tabBar("问答")
          }


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
      }
      .onRefreshing(() => {
        this.viewModel.fetchArticles(0)
      })
    }
    .backgroundColor($r('app.color.page'))
    .title("探索")
    .width('100%')
    .height('100%')
  }
}