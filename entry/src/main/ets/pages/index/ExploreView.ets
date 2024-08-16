import RouterPaths from "../../constants/RouterPaths";
import Article from "../../models/Article";
import Course from "../../models/Course";
import ExploreViewModel from "../../viewmodels/ExploreViewModel";
import { ArticleRow } from "../../views/ArticleRow";
import { WxAricleView } from "../article/WxAricleView";
import { CirclesView } from "../explore/CirclesView";
import { ProjectsView } from "../explore/ProjectsView";
import { WendasView } from "../explore/WendasView";

@Preview
@ComponentV2
export struct ExploreView {
  @Local viewModel: ExploreViewModel = new ExploreViewModel();
  @Require @Param pageInfos: NavPathStack;

  aboutToAppear(): void {
    this.viewModel.fetchArticles(0)
    this.viewModel.fetchWXMP()
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
              WendasView({ pageInfos: this.pageInfos })
            }.tabBar("问答")

            ForEach(this.viewModel.wxmp, (item: Course) => {
              TabContent() {
                WxAricleView({ pageInfos: this.pageInfos })
              }.tabBar(item.name)
            })

          }
          .barMode(BarMode.Scrollable)


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