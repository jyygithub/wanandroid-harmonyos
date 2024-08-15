import { rcp } from '@kit.RemoteCommunicationKit';
import { BusinessError } from '@kit.BasicServicesKit';
import Article from '../models/Article';
import ApiRepo from '../models/ApiRepo';
import PageRepo from '../models/PageRepo';
import Course from '../models/Course';

@ObservedV2
export default class ExploreViewModel {
  @Trace articles: Array<Article> = []
  @Trace wxmp: Array<Course> = []
  @Trace isRefreshing: boolean = false

  fetchArticles(page: number) {
    this.isRefreshing = true
    const getURL = `https://www.wanandroid.com/article/listproject/${page}/json`;
    const session = rcp.createSession();
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

  fetchWXMP() {
    this.isRefreshing = true
    const getURL = `https://wanandroid.com/wxarticle/chapters/json`;
    const session = rcp.createSession();
    session.get(getURL).then((response) => {
      console.info(`Response succeeded: ${JSON.stringify(response)}`);
      let result = JSON.parse(JSON.stringify(response)) as ApiRepo<Array<Course>>
      this.wxmp = result.data ?? []
    }).catch((err: BusinessError) => {
      console.error(`Response err: Code is ${JSON.stringify(err.code)}, message is ${JSON.stringify(err)}`);
    }).finally(() => {
      this.isRefreshing = false
      session.close()
    });
  }
}