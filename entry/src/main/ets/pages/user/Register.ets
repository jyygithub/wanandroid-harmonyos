@Builder
export function RegisterBuilder(name: string, param: Object) {
  Register()
}

@Preview
@ComponentV2
struct Register {
  build() {
    NavDestination() {

    }
    .title("知识体系")
  }
}