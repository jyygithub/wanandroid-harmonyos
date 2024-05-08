@Preview
@ComponentV2
export struct Mine {
  build() {

    NavDestination() {


      List({ space: 12 }) {
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

        ListItem() {
          Row({ space: 12 }) {
            SymbolGlyph($r('sys.symbol.share'))
              .fontSize(20)
            Text("我的分享").layoutWeight(1)
          }
          .justifyContent(FlexAlign.Center)
          .width('100%')
          .padding(12)
          .borderRadius(12)
          .backgroundColor(Color.White)
        }

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
        }

        ListItem() {
          Row({ space: 12 }) {
            SymbolGlyph($r('sys.symbol.list_bullet_circle'))
              .fontSize(20)
            Text("积分排行榜").layoutWeight(1)
          }
          .justifyContent(FlexAlign.Center)
          .width('100%')
          .padding(12)
          .borderRadius(12)
          .backgroundColor(Color.White)
        }

        ListItem() {
          Row({ space: 12 }) {
            SymbolGlyph($r('sys.symbol.info_circle'))
              .fontSize(20)
            Text("关于玩Android").layoutWeight(1)
          }
          .justifyContent(FlexAlign.Center)
          .width('100%')
          .padding(12)
          .borderRadius(12)
          .backgroundColor(Color.White)
        }
      }
      .padding({ left: 16, right: 16 })
      .width('100%')
      .height('100%')

    }
    .title("我的")
    .backgroundColor("#F8F8F8")
  }
}