import { rcp } from '@kit.RemoteCommunicationKit';
import { BusinessError } from '@kit.BasicServicesKit';
import Article from '../models/Article';
import ApiRepo from '../models/ApiRepo';
import PageRepo from '../models/PageRepo';
import Todo from '../models/Todo';

@ObservedV2
export default class DoneTodoListViewModel {
  @Trace items: Array<Todo> = []
  @Trace isRefreshing: boolean = false

  fetchArticles(page: number, cookies: string) {
    this.isRefreshing = true
    const getURL = `https://www.wanandroid.com/lg/todo/v2/list/1/json`;
    const session = rcp.createSession({
      headers: {
        "Content-Type": "application/x-www-form-urlencoded"
      },
      cookies: {
        "cookies": cookies
      }
    });
    session.post(getURL, `status=1`).then((response) => {
      console.info(`Response succeeded: ${JSON.stringify(response)}`);
      let result = JSON.parse(JSON.stringify(response)) as ApiRepo<PageRepo<Todo>>
      this.items = result.data?.datas ?? []
    }).catch((err: BusinessError) => {
      console.error(`Response err: Code is ${JSON.stringify(err.code)}, message is ${JSON.stringify(err)}`);
    }).finally(() => {
      this.isRefreshing = false
      session.close()
    });
  }

}