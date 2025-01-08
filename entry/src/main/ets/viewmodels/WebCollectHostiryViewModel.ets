import { rcp } from '@kit.RemoteCommunicationKit';
import { BusinessError } from '@kit.BasicServicesKit';
import Article from '../models/Article';
import ApiRepo from '../models/ApiRepo';
import PageRepo from '../models/PageRepo';
import WebUrl from '../models/WebUrl';

@ObservedV2
export default class WebCollectHostiryViewModel {
  @Trace articles: Array<WebUrl> = []
  @Trace isRefreshing: boolean = false

  fetchArticles(page: number, cookies: string) {
    this.isRefreshing = true
    const getURL = `https://www.wanandroid.com/lg/collect/usertools/json`;
    const session = rcp.createSession({
      cookies: {
        "cookies": cookies
      }
    });
    session.get(getURL).then((response) => {
      console.info(`Response succeeded: ${JSON.stringify(response)}`);
      let result = JSON.parse(JSON.stringify(response)) as ApiRepo<Array<WebUrl>>
      this.articles = result.data ?? []
    }).catch((err: BusinessError) => {
      console.error(`Response err: Code is ${JSON.stringify(err.code)}, message is ${JSON.stringify(err)}`);
    }).finally(() => {
      this.isRefreshing = false
      session.close()
    });
  }
}