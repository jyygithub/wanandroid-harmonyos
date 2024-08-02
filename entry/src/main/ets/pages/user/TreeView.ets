@Builder
export function TreeViewBuilder(name: string, param: Object) {
  TreeView()
}

@Preview
@ComponentV2
struct TreeView {
  build() {
    NavDestination() {

    }
    .title("知识体系")
  }
}