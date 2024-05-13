import Article from "../models/Article"

@ComponentV2
export struct ArticleRow {
  @Require @Param article: Article

  build() {
    Column({ space: 8 }) {
      Row() {
        Text(this.article.niceDate).fontSize(12).fontColor($r('app.color.secondary'))
        Blank()
        Text(this.article.author ?? this.article.shareUser ?? "").fontSize(12).fontColor($r('app.color.secondary'))
      }
      .width('100%')

      Text(this.article.title)
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .width('100%')
    }
    .padding(10)
    .backgroundColor($r('app.color.row'))
    .width('100%')
  }
}