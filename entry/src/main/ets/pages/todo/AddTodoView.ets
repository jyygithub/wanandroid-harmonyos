import { MyStorage } from "../../models/Storage";
import { PersistenceV2 } from "@kit.ArkUI";
import AddTodoViewModel from "../../viewmodels/AddTodoViewModel";

@Builder
export function AddTodoViewBuilder(name: string, param: Object) {
  AddTodoView()
}

@Preview
@ComponentV2
struct AddTodoView {
  pageInfos: NavPathStack = new NavPathStack();
  @Local storage: MyStorage = PersistenceV2.connect(MyStorage, () => new MyStorage())!;
  @Local viewModel: AddTodoViewModel = new AddTodoViewModel();
  @Local title: string = ''
  @Local content: string = ''

  build() {
    NavDestination() {

      Column({ space: 20 }) {

        TextInput()
          .onChange((value) => {
            this.title = value
          })

        TextArea()
          .height(500)
          .onChange((value) => {
            this.content = value
          })

      }
      .padding({ left: 16, right: 16 })
      .width('100%')
      .height('100%')

    }
    .height('100%')
    .width('100%')
    .title('新增待办')
    .backgroundColor($r('app.color.page'))
    .menus([{
      value: '提交',
      icon: $r('sys.media.ohos_ic_public_ok'),
      action: () => {
        this.viewModel.addTodo(this.title, this.content, this.storage.cookies)
      }
    }])
    .onReady((context: NavDestinationContext) => {
      this.pageInfos = context.pathStack;
    })
  }
}