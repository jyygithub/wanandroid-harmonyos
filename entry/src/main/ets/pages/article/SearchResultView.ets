import SearchViewModel from "../../viewmodels/SearchViewModel";
import { ChipSize, ChipGroup } from '@kit.ArkUI'

@Builder
export function SearchResultViewBuilder(name: string, param: Object) {
  SearchResultView()
}

@Preview
@ComponentV2
export struct SearchResultView {
  @Local viewModel: SearchViewModel = new SearchViewModel();
  @Local searchKey: string = ""

  aboutToAppear(): void {
    this.viewModel.fetchHotKey()
  }

  build() {
    NavDestination() {
      Column() {
        TextInput({ placeholder: "请输入..." })
          .onChange((value) => {
            this.searchKey = value
          })

        List() {
          ForEach(this.viewModel.articles, (item: Article) => {
            ListItem() {
              ArticleRow({ article: item })
            }
            .onClick(() => {
              this.pageInfos.pushPathByName(RouterPaths.ArticleView, item)
            })
          })
        }
        .divider({ strokeWidth: 1 })
      }
    }
    .height('100%')
    .width('100%')
    .title('搜索结果')
    .backgroundColor($r('app.color.page'))
  }
}