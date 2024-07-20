import RouterPaths from "../../constants/RouterPaths";

@Preview
@ComponentV2
export struct Mine {
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
          this.pageInfos.pushPathByName(RouterPaths.Login, null)
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
          this.pageInfos.pushPathByName(RouterPaths.ShareHistory, null)
        })

        ListItem() {
          Row({ space: 12 }) {
            SymbolGlyph($r('sys.symbol.share'))
              .fontSize(20)
            Text("我的收藏").layoutWeight(1)
          }
          .justifyContent(FlexAlign.Center)
          .width('100%')
          .padding(12)
          .backgroundColor(Color.White)
        }.onClick(() => {
          this.pageInfos.pushPathByName(RouterPaths.CollectHistory, null)
        })

        ListItem() {
          Row({ space: 12 }) {
            SymbolGlyph($r('sys.symbol.share'))
              .fontSize(20)
            Text("浏览历史").layoutWeight(1)
          }
          .justifyContent(FlexAlign.Center)
          .width('100%')
          .padding(12)
          .borderRadius({ bottomLeft: 12, bottomRight: 12 })
          .backgroundColor(Color.White)
        }.onClick(() => {
          this.pageInfos.pushPathByName(RouterPaths.ReadHistory, null)
        })

        ListItem() {
          Row({ space: 12 }) {
            SymbolGlyph($r('sys.symbol.timer'))
              .fontSize(20)
            Text("知识体系").layoutWeight(1)
          }
          .justifyContent(FlexAlign.Center)
          .width('100%')
          .padding(12)
          .borderRadius(12)
          .backgroundColor(Color.White)
        }.margin({ top: 20 })
        .onClick(() => {
          this.pageInfos.pushPathByName(RouterPaths.Tree, null)
        })

        ListItem() {
          Row({ space: 12 }) {
            SymbolGlyph($r('sys.symbol.list_bullet_circle'))
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
          this.pageInfos.pushPathByName(RouterPaths.CoinsHistory, null)
        })

        ListItem() {
          Row({ space: 12 }) {
            SymbolGlyph($r('sys.symbol.list_bullet_circle'))
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
            SymbolGlyph($r('sys.symbol.list_bullet_circle'))
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
          this.pageInfos.pushPathByName(RouterPaths.Settings, null)
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
          this.pageInfos.pushPathByName(RouterPaths.About, null)
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