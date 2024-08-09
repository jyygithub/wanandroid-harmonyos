@Builder
export function SettingsViewBuilder(name: string, param: Object) {
  SettingsView()
}

@Preview
@ComponentV2
struct SettingsView {
  build() {
    NavDestination() {

    }
    .title("设置")
  }
}