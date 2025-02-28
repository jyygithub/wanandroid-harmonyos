import { rcp } from '@kit.RemoteCommunicationKit';
import { BusinessError } from '@kit.BasicServicesKit';
import Todo from '../models/Todo';

@ObservedV2
export default class EditTodoViewModel {

  editTodo(id: number, title: string, content: string, date: String, cookies: string) {
    const getURL = `https://www.wanandroid.com/lg/todo/update/${id}/json`;
    const params = `title=${title}&content=${content}&date=${date}`
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