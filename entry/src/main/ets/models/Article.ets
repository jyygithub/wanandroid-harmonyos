export default class Article {
  id: number = 0
  originId: number | undefined
  title: string = ""
  link: string = ""
  niceDate: string | null = null
  author: string | null = null
  shareUser: string | null = null
  superChapterName: string | null = null
  chapterName: string | null = null

  constructor() {
  }
}