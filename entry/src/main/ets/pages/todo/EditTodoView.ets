import { MyStorage } from "../../models/Storage";
import { PersistenceV2 } from "@kit.ArkUI";
import AddTodoViewModel from "../../viewmodels/AddTodoViewModel";
import { DateUtils } from "../../utils/DateUtils";
import RouterPaths from "../../constants/RouterPaths";
import Todo from "../../models/Todo";
import EditTodoViewModel from "../../viewmodels/EditTodoViewModel";

@Builder
export function EditTodoViewBuilder(name: string, param: Object) {
  EditTodoView()
}

@Preview
@ComponentV2
struct EditTodoView {
  pageInfos: NavPathStack = new NavPathStack();
  @Local storage: MyStorage = PersistenceV2.connect(MyStorage, () => new MyStorage())!;
  @Local viewModel: EditTodoViewModel = new EditTodoViewModel();
  @Local title: string = ''
  @Local content: string = ''
  @Local todoId: number = 0
  @Local currentDate: Date = new Date()

  build() {
    NavDestination() {

      Column({ space: 20 }) {
        Text(DateUtils.formatDate(this.currentDate))
          .backgroundColor($r('app.color.press'))
          .width('100%')
          .padding({
            top: 10,
            bottom: 10,
            left: 16,
            right: 16
          })
          .borderRadius(16)
          .onClick(() => {
            this.getUIContext().showDatePickerDialog({
              start: new Date(),
              end: new Date("2050-12-31"),
              selected: new Date(),
              lunarSwitch: false,
              showTime: false,
              onDateAccept: (value: Date) => {
                this.currentDate = value
              },
            })
          })
        TextInput({ placeholder: "待办名称...", text: this.title })
          .onChange((value) => {
            this.title = value
          })

        TextArea({ placeholder: "待办明细...", text: this.content })
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
    .title('编辑待办')
    .backgroundColor($r('app.color.page'))
    .menus([{
      value: '提交',
      icon: $r('sys.media.ohos_ic_public_ok'),
      action: () => {
        this.viewModel.editTodo(this.todoId, this.title, this.content, DateUtils.formatDate(this.currentDate),
          this.storage.cookies)
      }
    }])
    .onReady((context: NavDestinationContext) => {
      this.pageInfos = context.pathStack;
      const todo = this.pageInfos.getParamByName(RouterPaths.EditTodoView).pop() as Todo
      this.title = todo.title
      this.content = todo.content
      this.todoId = todo.id
      this.currentDate = new Date(todo.dateStr)
    })
  }
}