import { MyStorage } from "../../../models/Storage";
import CollectWebUrlViewModel from "../../../viewmodels/CollectWebUrlViewModel";
import { PersistenceV2 } from "@kit.ArkUI";
import RouterPaths from "../../../constants/RouterPaths";
import WebUrl from "../../../models/WebUrl";
import EditCollectWebUrlViewModel from "../../../viewmodels/EditCollectWebUrlViewModel";

@Builder
export function EditCollectWebUrlViewBuilder(name: string, param: Object) {
  EditCollectWebUrlView()
}

@Preview
@ComponentV2
struct EditCollectWebUrlView {
  @Local storage: MyStorage = PersistenceV2.connect(MyStorage, () => new MyStorage())!;
  pageInfos: NavPathStack = new NavPathStack();
  @Local viewModel: EditCollectWebUrlViewModel = new EditCollectWebUrlViewModel()
  @Local wid: number = 0
  @Local name: string = ''
  @Local link: string = ''

  build() {
    NavDestination() {

      Column({ space: 20 }) {
        TextInput({ placeholder: "网站名称", text: this.name })
          .onChange((value) => {
            this.name = value
          })
        TextArea({ placeholder: "链接地址", text: this.link })
          .onChange((value) => {
            this.link = value
          })
        Button("保存").width('100%')
          .onClick(() => {
            this.viewModel.collect(this.wid, this.name, this.link, this.storage.cookies)
          })
      }
      .padding({ left: 16, right: 16 })
      .height('100%')

    }
    .height('100%')
    .width('100%')
    .title('编辑收藏网站')
    .backgroundColor($r('app.color.page'))
    .onReady((context: NavDestinationContext) => {
      this.pageInfos = context.pathStack;
      const param = this.pageInfos.getParamByName(RouterPaths.EditCollectWebUrlView).pop() as WebUrl
      this.wid = param.id
      this.name = param.name
      this.link = param.link
    })
  }
}