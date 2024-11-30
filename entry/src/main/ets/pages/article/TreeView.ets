import RouterPaths from "../../constants/RouterPaths";
import Course from "../../models/Course";
import TreeViewModel from "../../viewmodels/TreeViewModel";

@Builder
export function TreeViewBuilder(name: string, param: Object) {
  TreeView()
}

@Preview
@ComponentV2
struct TreeView {
  @Local viewModel: TreeViewModel = new TreeViewModel()
  pageInfos: NavPathStack = new NavPathStack();

  aboutToAppear(): void {
    this.viewModel.fetchTree()
  }

  @Builder
  itemHead(text: ResourceStr) {
    Text(text)
      .fontSize(16)
      .backgroundColor($r('app.color.brand'))
      .fontColor(Color.White)
      .padding(8)
  }

  build() {
    NavDestination() {

      List() {
        ForEach(this.viewModel.trees, (item: Course) => {
          ListItemGroup({ header: this.itemHead(item.name) }) {

            ForEach(item.children, (item0: Course) => {
              ListItem() {
                Text(item0.name)
                  .padding(8)
              }.onClick(() => {
                this.pageInfos.pushPathByName(RouterPaths.TreeArticlesView, item0)
              })
            })
          }
        })
      }


      .width('100%')
      .height('100%')
      .padding({ left: 16, right: 16 })
    }
    .title("知识体系")
    .backgroundColor($r('app.color.page'))
    .onReady((context: NavDestinationContext) => {
      this.pageInfos = context.pathStack;
    })
  }
}