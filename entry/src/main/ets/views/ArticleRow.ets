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

      Row({ space: 4 }) {
        if (this.article.superChapterName) {
          Text(this.article.superChapterName)
            .fontSize(10)
            .backgroundColor($r('app.color.brand'))
            .borderRadius(4)
            .fontColor(Color.White)
            .padding(4)
        }
        if (this.article.chapterName) {
          Text(this.article.chapterName)
            .fontSize(10)
            .backgroundColor($r('app.color.brand'))
            .borderRadius(4)
            .fontColor(Color.White)
            .padding(4)
        }
        Blank()
      }.width('100%')
    }
    .padding(16)
    .width('100%')
  }
}