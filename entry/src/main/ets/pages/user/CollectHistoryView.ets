import RouterPaths from "../../constants/RouterPaths";
import { ArticleCollectHistoryView } from "./collect/ArticleCollectHistoryView"
import { WebCollectHistoryView } from "./collect/WebCollectHistoryView"

@Builder
export function CollectHistoryViewBuilder(name: string, param: Object) {
  CollectHistoryView()
}

@Preview
@ComponentV2
struct CollectHistoryView {
  pageInfos: NavPathStack = new NavPathStack();

  build() {
    NavDestination() {
      Tabs({ barPosition: BarPosition.Start }) {
        TabContent() {
          ArticleCollectHistoryView({ pageInfos: this.pageInfos })
        }.tabBar("文章")

        TabContent() {
          WebCollectHistoryView({ pageInfos: this.pageInfos })
        }.tabBar("网址")

      }

    }
    .title("我的收藏")
    .backgroundColor($r('app.color.page'))
    .menus([{
      value: '新增',
      icon: $r('sys.media.ohos_ic_public_add'),
      action: () => {
        this.getUIContext().showTextPickerDialog({
          alignment: DialogAlignment.Bottom,
          range: ['收藏站外文章', '收藏网址'],
          canLoop: false,
          selected: 0,
          onAccept: (value: TextPickerResult) => {
            if ((value.index as number) == 0) {
              this.pageInfos.pushPathByName(RouterPaths.CollectArticleUrlView, null)
            } else {
              this.pageInfos.pushPathByName(RouterPaths.CollectWebUrlView, null)
            }
          }
        })
      }
    }])
    .onReady((context: NavDestinationContext) => {
      this.pageInfos = context.pathStack;
    })
  }
}