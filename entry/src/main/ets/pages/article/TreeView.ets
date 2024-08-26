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
      List() {
        ForEach(this.viewModel.courses, (item: Course) => {
          ListItem() {
            Text(item.name)
          }
        })
      }
    }
    .title("知识体系")
    .onReady((context: NavDestinationContext) => {
      this.pageInfos = context.pathStack;
    })
  }
}