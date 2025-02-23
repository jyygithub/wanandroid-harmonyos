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
  @Local currentDate: Date = new Date()

  build() {
    NavDestination() {

      Column({ space: 20 }) {
        Text(this.currentDate.toDateString()).backgroundColor($r('app.color.press'))
          .width('100%')
          .padding({
            top: 10,
            bottom: 10,
            left: 16,
            right: 16
          })
          .borderRadius(16)
        TextInput({ placeholder: "待办名称..." })
          .onChange((value) => {
            this.title = value
          })

        TextArea({ placeholder: "待办明细..." })
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
        this.viewModel.addTodo(this.title, this.content, this.currentDate.toDateString(), this.storage.cookies)
      }
    }])
    .onReady((context: NavDestinationContext) => {
      this.pageInfos = context.pathStack;
    })
  }
}