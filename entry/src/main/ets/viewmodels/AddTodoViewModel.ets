import { rcp } from '@kit.RemoteCommunicationKit';
import { BusinessError } from '@kit.BasicServicesKit';
import Todo from '../models/Todo';

@ObservedV2
export default class AddTodoViewModel {
  @Trace todoList: Array<Todo> = []

  addTodo(title: string, content: string, cookies: string) {
    const getURL = `https://www.wanandroid.com/lg/todo/add/json`;
    const params = `title=${title}&content=${content}`
    const session = rcp.createSession({
      headers: {
        "Content-Type": "application/x-www-form-urlencoded"
      },
      cookies: {
        "cookies": cookies
      }
    });
    session.post(getURL, params).then((response) => {
      console.info(`Response succeeded: ${JSON.stringify(response)}`);
    }).catch((err: BusinessError) => {
      console.error(`Response err: Code is ${JSON.stringify(err.code)}, message is ${JSON.stringify(err)}`);
    }).finally(() => {
      session.close()
    });
  }
}