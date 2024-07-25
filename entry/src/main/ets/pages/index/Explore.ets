import RouterPaths from "../../constants/RouterPaths";
import Article from "../../models/Article";
import ExploreViewModel from "../../viewmodels/ExploreViewModel";
import { ArticleRow } from "../../views/ArticleRow";
import { promptAction, TabTitleBar, TabTitleBarMenuItem, TabTitleBarTabItem } from "@kit.ArkUI";

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
              Column().width('100%').height('100%').backgroundColor(Color.Pink)
            }.tabBar("项目")

            TabContent() {
              Column().width('100%').height('100%').backgroundColor(Color.Green)
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