import { MyStorage } from "../../../models/Storage";
import { PersistenceV2 } from "@kit.ArkUI";
import CollectArticleViewModel from "../../../viewmodels/CollectArticleViewModel";
import RouterPaths from "../../../constants/RouterPaths";
import Article from "../../../models/Article";

@Builder
export function EditCollectArticleUrlViewBuilder(name: string, param: Object) {
  EditCollectArticleUrlView()
}

@Preview
@ComponentV2
struct EditCollectArticleUrlView {
  @Local storage: MyStorage = PersistenceV2.connect(MyStorage, () => new MyStorage())!;
  pageInfos: NavPathStack = new NavPathStack();
  @Local viewModel: CollectArticleViewModel = new CollectArticleViewModel()
  @Local title: string = ''
  @Local author: string = ''
  @Local link: string = ''

  build() {
    NavDestination() {

      Column({ space: 20 }) {
        TextInput({ placeholder: "文章标题", text: this.title })
          .onChange((value) => {
            this.title = value
          })
        TextInput({ placeholder: "文章作者", text: this.author })
          .onChange((value) => {
            this.author = value
          })
        TextArea({ placeholder: "链接地址", text: this.link })
          .onChange((value) => {
            this.link = value
          })
        Button("保存").width('100%')
          .onClick(() => {
            this.viewModel.collect(this.title, this.author, this.link, this.storage.cookies)
          })
      }
      .padding({ left: 16, right: 16 })
      .height('100%')

    }
    .height('100%')
    .width('100%')
    .title('编辑收藏文章')
    .backgroundColor($r('app.color.page'))
    .onReady((context: NavDestinationContext) => {
      this.pageInfos = context.pathStack;
      const param = this.pageInfos.getParamByName(RouterPaths.EditCollectArticleUrlView).pop() as Article
      this.title = param.title
      this.author = param.author || ""
      this.link = param.link
    })
  }
}