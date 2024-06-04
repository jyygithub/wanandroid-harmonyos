@Builder
export function SettingsBuilder(name: string, param: Object) {
  Settings()
}

@Preview
@ComponentV2
struct Settings {
  build() {
    NavDestination() {

    }
    .title("设置")
  }
}