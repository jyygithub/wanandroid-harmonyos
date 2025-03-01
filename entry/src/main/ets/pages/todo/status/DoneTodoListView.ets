import RouterPaths from "../../../constants/RouterPaths";
import Article from "../../../models/Article";
import { MyStorage } from "../../../models/Storage";
import ArticleCollectHostiryViewModel from "../../../viewmodels/ArticleCollectHostiryViewModel";
import { ArticleRow } from "../../../views/ArticleRow";
import { PersistenceV2 } from "@kit.ArkUI";
import DoneTodoListViewModel from "../../../viewmodels/DoneTodoListViewModel";
import Todo from "../../../models/Todo";
import { TodoRow } from "../../../views/TodoRow";

@Preview
@ComponentV2
export struct DoneTodoListView {
  @Local storage: MyStorage = PersistenceV2.connect(MyStorage, () => new MyStorage())!;
  @Local viewModel: DoneTodoListViewModel = new DoneTodoListViewModel();
  @Require @Param pageInfos: NavPathStack;

  aboutToAppear(): void {
    this.viewModel.fetchArticles(1, this.storage.cookies)
  }

  @Builder
  itemEnd(item: Todo) {

    Row() {
      // 构建尾端滑出组件
      Button("未完成")
        .onClick(() => {
          this.viewModel.updateStatus(item.id, this.storage.cookies)
        })
      // 构建尾端滑出组件
      Button("删除")
        .onClick(() => {
          this.viewModel.deleteTodo(item.id, this.storage.cookies)
        })
      // 构建尾端滑出组件
      Button("编辑")
        .onClick(() => {
          this.pageInfos.pushPathByName(RouterPaths.EditTodoView, item)
        })
    }
  }

  build() {
    NavDestination() {
      Refresh({ refreshing: this.viewModel.isRefreshing }) {
        List() {
          ForEach(this.viewModel.items, (item: Todo) => {
            ListItem() {
              TodoRow({ todo: item })
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
        .padding({ left: 16, right: 16 })
        .divider({ strokeWidth: 1 })
      }
      .onRefreshing(() => {
        this.viewModel.fetchArticles(1, this.storage.cookies)
      })
    }
    .backgroundColor($r('app.color.page'))
    .width('100%')
    .height('100%')
  }
}