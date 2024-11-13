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

  build() {
    NavDestination() {
      Row() {
        List() {
          ForEach(this.viewModel.trees, (item: Course) => {
            ListItem() {
              Text(item.name)
            }
          })
        }
        .width('25%')

        List() {
          ForEach(this.viewModel.childTrees, (item: Course) => {
            ListItem() {
              Text(item.name)
            }
          })
        }
        .width('75%')
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