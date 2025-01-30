import RouterPaths from "../../../constants/RouterPaths";
import Article from "../../../models/Article";
import { MyStorage } from "../../../models/Storage";
import WebCollectHostiryViewModel from "../../../viewmodels/WebCollectHostiryViewModel";
import { ArticleRow } from "../../../views/ArticleRow";
import { PersistenceV2 } from "@kit.ArkUI";
import WebUrl from "../../../models/WebUrl";

@Preview
@ComponentV2
export struct WebCollectHistoryView {
  @Local storage: MyStorage = PersistenceV2.connect(MyStorage, () => new MyStorage())!;
  @Local viewModel: WebCollectHostiryViewModel = new WebCollectHostiryViewModel();
  @Require @Param pageInfos: NavPathStack;

  aboutToAppear(): void {
    this.viewModel.fetchArticles(0, this.storage.cookies)
  }

  @Builder
  itemEnd(item: WebUrl) {
    Row() {
      // 构建尾端滑出组件
      Button("移出")
        .onClick(() => {
          this.viewModel.cancelCollect(item.id, this.storage.cookies)
        })
      // 构建尾端滑出组件
      Button("编辑")
        .onClick(() => {
          this.pageInfos.pushPathByName(RouterPaths.EditCollectWebUrlView, item)
        })
    }
  }

  build() {
    NavDestination() {
      Refresh({ refreshing: this.viewModel.isRefreshing }) {
        List() {
          ForEach(this.viewModel.articles, (item: WebUrl) => {
            ListItem() {
              Column() {
                Text(item.name)
                Text(item.link)
              }.width('100%')
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
        .width('100%')
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