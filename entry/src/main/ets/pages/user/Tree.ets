@Builder
export function TreeBuilder(name: string, param: Object) {
  Tree()
}

@Preview
@ComponentV2
struct Tree {
  build() {
    NavDestination() {

    }
    .title("知识体系")
  }
}