import Article from "../models/Article"

@ComponentV2
export struct ArticleRow {
  @Require @Param article: Article

  build() {
    Column() {
      Text(this.article.title)
      Text(this.article.link)
      Text(this.article.niceDate)
    }
  }
}