import RouterPaths from "../../../constants/RouterPaths";
import Article from "../../../models/Article";
import { MyStorage } from "../../../models/Storage";
import ArticleCollectHostiryViewModel from "../../../viewmodels/ArticleCollectHostiryViewModel";
import { ArticleRow } from "../../../views/ArticleRow";
import { PersistenceV2 } from "@kit.ArkUI";

@Preview
@ComponentV2
export struct ArticleCollectHistoryView {
  @Local storage: MyStorage = PersistenceV2.connect(MyStorage, () => new MyStorage())!;
  @Local viewModel: ArticleCollectHostiryViewModel = new ArticleCollectHostiryViewModel();
  @Require @Param pageInfos: NavPathStack;

  aboutToAppear(): void {
    this.viewModel.fetchArticles(0,this.storage.cookies)
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
        this.viewModel.fetchArticles(0,this.storage.cookies)
      })
    }
    .backgroundColor($r('app.color.page'))
    .width('100%')
    .height('100%')
  }
}