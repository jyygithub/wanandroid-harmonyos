import Article from "./Article"

export class Harmony {
  links : HarmonyLinks
  open_sources : HarmonyLinks
  tools : HarmonyLinks

  constructor(links: HarmonyLinks, open_sources: HarmonyLinks, tools: HarmonyLinks) {
    this.links = links
    this.open_sources = open_sources
    this.tools = tools
  }


}

export class HarmonyLinks {
  articleList : Array<Article> = []
}