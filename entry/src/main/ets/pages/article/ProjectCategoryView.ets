import RouterPaths from "../../constants/RouterPaths";
import Course from "../../models/Course";
import ProjectCategoryViewModel from "../../viewmodels/ProjectCategoryViewModel";
import TreeViewModel from "../../viewmodels/TreeViewModel";

@Builder
export function ProjectCategoryViewBuilder(name: string, param: Object) {
  ProjectCategoryView()
}

@Preview
@ComponentV2
struct ProjectCategoryView {
  @Local viewModel: ProjectCategoryViewModel = new ProjectCategoryViewModel()
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


          ListItem() {
            Text(item.name)
              .padding(8)
          }.onClick(() => {
            this.pageInfos.pushPathByName(RouterPaths.ProjectArticlesView, item)
          })
        })


      }


      .width('100%')
      .height('100%')
      .padding({ left: 16, right: 16 })
    }
    .title("项目分类")
    .backgroundColor($r('app.color.page'))
    .onReady((context: NavDestinationContext) => {
      this.pageInfos = context.pathStack;
    })
  }
}