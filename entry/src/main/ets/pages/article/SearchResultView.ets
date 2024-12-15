import SearchResultViewModel from "../../viewmodels/SearchResultViewModel";
import Article from "../../models/Article";
import { ArticleRow } from "../../views/ArticleRow";
import RouterPaths from "../../constants/RouterPaths";

@Builder
export function SearchResultViewBuilder(name: string, param: Object) {
  SearchResultView()
}

@Preview
@ComponentV2
export struct SearchResultView {
  pageInfos: NavPathStack = new NavPathStack();
  @Local viewModel: SearchResultViewModel = new SearchResultViewModel();

  build() {
    NavDestination() {
      Column() {
        TextInput({ placeholder: "请输入..." })
          .onChange((value) => {
            this.viewModel.fetchArticles(0, value)
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
    .onReady((context: NavDestinationContext) => {
      this.pageInfos = context.pathStack;
    })
  }
}