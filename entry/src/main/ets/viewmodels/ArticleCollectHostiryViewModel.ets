import { rcp } from '@kit.RemoteCommunicationKit';
import { BusinessError } from '@kit.BasicServicesKit';
import Article from '../models/Article';
import ApiRepo from '../models/ApiRepo';
import PageRepo from '../models/PageRepo';

@ObservedV2
export default class ArticleCollectHostiryViewModel {
  @Trace articles: Array<Article> = []
  @Trace isRefreshing: boolean = false

  fetchArticles(page: number, cookies: string) {
    this.isRefreshing = true
    const getURL = `https://www.wanandroid.com/lg/collect/list/0/json`;
    const session = rcp.createSession({
      cookies: {
        "cookies": cookies
      }
    });
    session.get(getURL).then((response) => {
      console.info(`Response succeeded: ${JSON.stringify(response)}`);
      let result = JSON.parse(JSON.stringify(response)) as ApiRepo<PageRepo<Article>>
      this.articles = result.data?.datas ?? []
    }).catch((err: BusinessError) => {
      console.error(`Response err: Code is ${JSON.stringify(err.code)}, message is ${JSON.stringify(err)}`);
    }).finally(() => {
      this.isRefreshing = false
      session.close()
    });
  }

  cancelCollect(id: number, originId: number | undefined, cookies: string) {
    const getURL = `https://www.wanandroid.com/lg/uncollect/${id}/json`;
    const session = rcp.createSession({
      headers: {
        "Content-Type": "application/x-www-form-urlencoded"
      },
      cookies: {
        "cookies": cookies
      }
    });
    session.post(getURL, `originId=${originId ? originId : -1}`).then((response) => {
      console.info(`Response succeeded: ${JSON.stringify(response)}`);
    }).catch((err: BusinessError) => {
      console.error(`Response err: Code is ${JSON.stringify(err.code)}, message is ${JSON.stringify(err)}`);
    }).finally(() => {
      this.isRefreshing = false
      session.close()
    });
  }
}