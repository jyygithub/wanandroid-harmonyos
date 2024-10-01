import { rcp } from '@kit.RemoteCommunicationKit';
import { BusinessError } from '@kit.BasicServicesKit';
import Article from '../models/Article';
import ApiRepo from '../models/ApiRepo';
import PageRepo from '../models/PageRepo';
import Todo from '../models/Todo';

@ObservedV2
export default class TodoListViewModel {
  @Trace todoList: Array<Todo> = []
  @Trace isRefreshing: boolean = false

  fetchArticles(page: number) {
    this.isRefreshing = true
    const getURL = `https://www.wanandroid.com/lg/todo/v2/list/1/json`;
    const session = rcp.createSession();
    session.get(getURL).then((response) => {
      console.info(`Response succeeded: ${JSON.stringify(response)}`);
      let result = JSON.parse(JSON.stringify(response)) as ApiRepo<PageRepo<Todo>>
      this.todoList = result.data?.datas ?? []
    }).catch((err: BusinessError) => {
      console.error(`Response err: Code is ${JSON.stringify(err.code)}, message is ${JSON.stringify(err)}`);
    }).finally(() => {
      this.isRefreshing = false
      session.close()
    });
  }
}