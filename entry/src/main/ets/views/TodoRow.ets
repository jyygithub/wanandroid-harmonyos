import Todo from "../models/Todo"

@ComponentV2
export struct TodoRow {
  @Require @Param todo: Todo

  build() {
    Column({ space: 8 }) {
      Row() {
        Text(this.todo.dateStr).fontSize(12).fontColor($r('app.color.secondary'))
        Blank()
        Text(`${this.todo.type}`).fontSize(12).fontColor($r('app.color.secondary'))
      }
      .width('100%')

      Text(this.todo.title)
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .width('100%')

      Text(this.todo.content)
        .fontSize(14)
        .width('100%')

    }
    .padding(16)
    .width('100%')
    .backgroundColor($r('app.color.row'))
  }
}