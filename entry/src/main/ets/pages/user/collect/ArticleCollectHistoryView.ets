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
    this.viewModel.fetchArticles(0, this.storage.cookies)
  }

  @Builder
  itemEnd(item: Article) {

    Row() {
      // 构建尾端滑出组件
      Button("移出")
        .onClick(() => {
          this.viewModel.cancelCollect(item.id, item.originId, this.storage.cookies)
        })
      // 构建尾端滑出组件
      Button("编辑")
        .onClick(() => {
          this.pageInfos.pushPathByName(RouterPaths.EditCollectArticleUrlView, item)
        })
    }
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
            .swipeAction({
              end: {
                // index为该ListItem在List中的索引值。
                builder: () => {
                  this.itemEnd(item)
                },
              }
            }) // 设置侧滑属性.
          })
        }
        .divider({ strokeWidth: 1 })
      }
      .onRefreshing(() => {
        this.viewModel.fetchArticles(0, this.storage.cookies)
      })
    }
    .backgroundColor($r('app.color.page'))
    .width('100%')
    .height('100%')
  }
}