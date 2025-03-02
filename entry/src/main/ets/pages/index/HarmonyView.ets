import RouterPaths from "../../constants/RouterPaths";
import Article from "../../models/Article";
import HarmonyViewModel from "../../viewmodels/HarmonyViewModel";
import HomeViewModel from "../../viewmodels/HomeViewModel";
import { ArticleRow } from "../../views/ArticleRow";

@Preview
@ComponentV2
export struct HarmonyView {
  @Local viewModel: HarmonyViewModel = new HarmonyViewModel();
  @Require @Param pageInfos: NavPathStack;

  aboutToAppear(): void {
    this.viewModel.fetchData()
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
        this.viewModel.fetchData()
      })
    }
    .backgroundColor($r('app.color.page'))
    .title("鸿蒙")
    .width('100%')
    .height('100%')
  }
}