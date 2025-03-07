import RouterPaths from "../../constants/RouterPaths";
import { MyStorage } from "../../models/Storage";
import { PersistenceV2 } from "@kit.ArkUI";

@Preview
@ComponentV2
export struct MineView {
  @Local storage: MyStorage = PersistenceV2.connect(MyStorage, () => new MyStorage())!;
  @Require @Param pageInfos: NavPathStack;

  build() {

    NavDestination() {
      List({ space: 1 }) {

        ListItem() {
          Row({ space: 12 }) {
            Image($r('app.media.startIcon'))
              .width(48)
              .height(48)
            Text('玩Android').fontSize(18).fontWeight(FontWeight.Bold)
          }
          .width('100%')
          .padding(12)
          .borderRadius(12)
          .backgroundColor(Color.White)
        }
        .onClick(() => {
          if (this.storage.cookies == "") {
            this.pageInfos.pushPathByName(RouterPaths.LoginView, null)
          } else {
            this.pageInfos.pushPathByName(RouterPaths.UserView, null)
          }
        })

        ListItem() {
          Row({ space: 12 }) {
            SymbolGlyph($r('sys.symbol.calendar'))
              .fontSize(20)
            Text("我的待办").layoutWeight(1)
          }
          .justifyContent(FlexAlign.Center)
          .width('100%')
          .padding(12)
          .borderRadius(12)
          .backgroundColor(Color.White)
        }.margin({ top: 20 })
        .onClick(() => {
          this.pageInfos.pushPathByName(RouterPaths.TodoListView, null)
        })

        ListItem() {
          Row({ space: 12 }) {
            SymbolGlyph($r('sys.symbol.share'))
              .fontSize(20)
            Text("我的分享").layoutWeight(1)
          }
          .justifyContent(FlexAlign.Center)
          .width('100%')
          .padding(12)
          .borderRadius({ topLeft: 12, topRight: 12 })
          .backgroundColor(Color.White)
        }.margin({ top: 20 })
        .onClick(() => {
          this.pageInfos.pushPathByName(RouterPaths.ShareHistoryView, null)
        })

        ListItem() {
          Row({ space: 12 }) {
            SymbolGlyph($r('sys.symbol.star'))
              .fontSize(20)
            Text("我的收藏").layoutWeight(1)
          }
          .justifyContent(FlexAlign.Center)
          .width('100%')
          .padding(12)
          .backgroundColor(Color.White)
        }.onClick(() => {
          this.pageInfos.pushPathByName(RouterPaths.CollectHistoryView, null)
        })

        ListItem() {
          Row({ space: 12 }) {
            SymbolGlyph($r('sys.symbol.arrow_counterclockwise_clock'))
              .fontSize(20)
            Text("浏览历史").layoutWeight(1)
          }
          .justifyContent(FlexAlign.Center)
          .width('100%')
          .padding(12)
          .borderRadius({ bottomLeft: 12, bottomRight: 12 })
          .backgroundColor(Color.White)
        }.onClick(() => {
          this.pageInfos.pushPathByName(RouterPaths.ReadHistoryView, null)
        })

        ListItem() {
          Row({ space: 12 }) {
            SymbolGlyph($r('sys.symbol.drop_bottomrighthalf_inset_filled'))
              .fontSize(20)
            Text("知识体系").layoutWeight(1)
          }
          .justifyContent(FlexAlign.Center)
          .width('100%')
          .padding(12)
          .borderRadius({ topLeft: 12, topRight: 12 })
          .backgroundColor(Color.White)
        }.margin({ top: 20 })
        .onClick(() => {
          this.pageInfos.pushPathByName(RouterPaths.TreeView, null)
        })

        ListItem() {
          Row({ space: 12 }) {
            SymbolGlyph($r('sys.symbol.list_square'))
              .fontSize(20)
            Text("项目分类").layoutWeight(1)
          }
          .justifyContent(FlexAlign.Center)
          .width('100%')
          .padding(12)
          .borderRadius({ bottomLeft: 12, bottomRight: 12 })
          .backgroundColor(Color.White)
        }
        .onClick(() => {
          this.pageInfos.pushPathByName(RouterPaths.ProjectCategoryView, null)
        })

        ListItem() {
          Row({ space: 12 }) {
            SymbolGlyph($r('sys.symbol.nearlink'))
              .fontSize(20)
            Text("我的积分").layoutWeight(1)
          }
          .justifyContent(FlexAlign.Center)
          .width('100%')
          .padding(12)
          .borderRadius({ topLeft: 12, topRight: 12 })
          .backgroundColor(Color.White)
        }.margin({ top: 20 })
        .onClick(() => {
          this.pageInfos.pushPathByName(RouterPaths.CoinsHistoryView, null)
        })

        ListItem() {
          Row({ space: 12 }) {
            SymbolGlyph($r('sys.symbol.satellite_map'))
              .fontSize(20)
            Text("积分排行榜").layoutWeight(1)
          }
          .justifyContent(FlexAlign.Center)
          .width('100%')
          .padding(12)
          .borderRadius({ bottomLeft: 12, bottomRight: 12 })
          .backgroundColor(Color.White)
        }
        .onClick(() => {
          this.pageInfos.pushPathByName(RouterPaths.CoinsView, null)
        })

        ListItem() {
          Row({ space: 12 }) {
            SymbolGlyph($r('sys.symbol.smallcircle_filled_circle'))
              .fontSize(20)
            Text("常用工具").layoutWeight(1)
          }
          .justifyContent(FlexAlign.Center)
          .width('100%')
          .padding(12)
          .borderRadius(12)
          .backgroundColor(Color.White)
        }.margin({ top: 20 })
        .onClick(() => {
          this.pageInfos.pushPathByName(RouterPaths.ToolsView, null)
        })

        ListItem() {
          Row({ space: 12 }) {
            SymbolGlyph($r('sys.symbol.gearshape'))
              .fontSize(20)
            Text("设置").layoutWeight(1)
          }
          .justifyContent(FlexAlign.Center)
          .width('100%')
          .padding(12)
          .borderRadius({ topLeft: 12, topRight: 12 })
          .backgroundColor(Color.White)
        }.margin({ top: 20 })
        .onClick(() => {
          this.pageInfos.pushPathByName(RouterPaths.SettingsView, null)
        })

        ListItem() {
          Row({ space: 12 }) {
            SymbolGlyph($r('sys.symbol.info_circle'))
              .fontSize(20)
            Text("关于").layoutWeight(1)
          }
          .justifyContent(FlexAlign.Center)
          .width('100%')
          .padding(12)
          .borderRadius({ bottomLeft: 12, bottomRight: 12 })
          .backgroundColor(Color.White)
        }
        .onClick(() => {
          this.pageInfos.pushPathByName(RouterPaths.AboutView, null)
        })
      }
      .padding({ left: 16, right: 16 })
      .width('100%')
      .height('100%')

    }
    .title("我的")
    .backgroundColor($r('app.color.page'))
  }
}