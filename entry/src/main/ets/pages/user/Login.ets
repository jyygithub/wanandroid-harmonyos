@Builder
export function LoginBuilder(name: string, param: Object) {
  Login()
}

@Preview
@ComponentV2
struct Login {
  build() {
    NavDestination() {
      Column({ space: 10 }) {
        TextInput({ placeholder: "邮箱" })
        TextInput({ placeholder: "密码" })
        Button("立即登录").width('100%')
      }
      .padding(16)
    }
    .title("登录")
  }
}