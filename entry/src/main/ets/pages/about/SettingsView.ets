@Builder
export function SettingsViewBuilder(name: string, param: Object) {
  SettingsView()
}

@Preview
@ComponentV2
struct SettingsView {
  build() {
    NavDestination() {
      List() {
        ListItem() {
          Row({ space: 12 }) {
            SymbolGlyph($r('sys.symbol.share'))
              .fontSize(20)
            Text("深色模式").layoutWeight(1)
          }
          .justifyContent(FlexAlign.Center)
          .width('100%')
          .padding(12)
          .borderRadius(12)
          .backgroundColor(Color.White)
        }.margin({ top: 20 })
        .onClick(() => {

        })

        ListItem() {
          Row({ space: 12 }) {
            SymbolGlyph($r('sys.symbol.share'))
              .fontSize(20)
            Text("多语言").layoutWeight(1)
          }
          .justifyContent(FlexAlign.Center)
          .width('100%')
          .padding(12)
          .borderRadius(12)
          .backgroundColor(Color.White)
        }.margin({ top: 20 })
        .onClick(() => {

        })
      }
      .padding({ left: 16, right: 16 })
      .width('100%')
      .height('100%')
    }
    .title("设置")
    .backgroundColor($r('app.color.page'))
  }
}