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
          Text("深色模式")
        }

        ListItem() {
          Text("多语言")
        }
      }
    }
    .title("设置")
    .backgroundColor($r('app.color.page'))
  }
}