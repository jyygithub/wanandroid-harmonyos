import SearchViewModel from "../../viewmodels/SearchViewModel";
import { ChipSize, ChipGroup } from '@kit.ArkUI'
import RouterPaths from "../../constants/RouterPaths";

@Builder
export function SearchViewBuilder(name: string, param: Object) {
  SearchView()
}

@Preview
@ComponentV2
export struct SearchView {
  pageInfos: NavPathStack = new NavPathStack();
  @Local viewModel: SearchViewModel = new SearchViewModel();

  aboutToAppear(): void {
    this.viewModel.fetchHotKey()
  }

  build() {
    NavDestination() {
      Column() {

        Text('搜索...')
          .width('100%')
          .backgroundColor($r('sys.color.ohos_id_color_text_search_url'))
          .onClick(() => {
            this.pageInfos.pushPathByName(RouterPaths.SearchResultView, null)
          })

        ChipGroup({
          items: [
            {
              label: { text: "操作块1" },
            },
            {
              label: { text: "操作块2" },
            },
            {
              label: { text: "操作块3" },
            },
            {
              label: { text: "操作块4" },
            },
            {
              label: { text: "操作块5" },
            },
            {
              label: { text: "操作块6" },
            },
          ],
          itemStyle: {
            size: ChipSize.SMALL,
            backgroundColor: $r('sys.color.ohos_id_color_button_normal'),
            fontColor: $r('sys.color.ohos_id_color_text_primary'),
            selectedBackgroundColor: $r('sys.color.ohos_id_color_emphasize'),
            selectedFontColor: $r('sys.color.ohos_id_color_text_primary_contrary'),
          },
          multiple: false,
          chipGroupSpace: { itemSpace: 8, endSpace: 0 },
          chipGroupPadding: { top: 10, bottom: 10 },
          onChange: (activatedChipsIndex: Array<number>) => {
            console.log('chips on clicked, activated index ' + activatedChipsIndex)
          },
        })

      }
    }
    .height('100%')
    .width('100%')
    .title('搜索')
    .backgroundColor($r('app.color.page'))
    .onReady((context: NavDestinationContext) => {
      this.pageInfos = context.pathStack;
    })
  }
}