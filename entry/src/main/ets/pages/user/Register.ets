@Builder
export function RegisterBuilder(name: string, param: Object) {
  Register()
}

@Preview
@ComponentV2
struct Register {
  build() {
    NavDestination() {
      Column({ space: 10 }) {
        TextInput({ placeholder: "邮箱" })
          .onChange((value) => {

          })
        TextInput({ placeholder: "密码" })
          .onChange((value) => {

          })
        Button("立即注册").width('100%')
          .onClick(() => {

          })
      }
      .padding(16)
    }
    .title("注册")
  }
}