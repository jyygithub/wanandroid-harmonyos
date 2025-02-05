import { rcp } from '@kit.RemoteCommunicationKit';
import { BusinessError } from '@kit.BasicServicesKit';
import Article from '../models/Article';
import ApiRepo from '../models/ApiRepo';
import PageRepo from '../models/PageRepo';
import Todo from '../models/Todo';

@ObservedV2
export default class ArticleViewModel {
  collect(id: number, cookies: string) {
    const getURL = `https://www.wanandroid.com/lg/collect/${id}/json`;
    const session = rcp.createSession({
      cookies: {
        "cookies": cookies
      }
    });
    session.post(getURL).then((response) => {
      console.info(`Response succeeded: ${JSON.stringify(response)}`);
    }).catch((err: BusinessError) => {
      console.error(`Response err: Code is ${JSON.stringify(err.code)}, message is ${JSON.stringify(err)}`);
    }).finally(() => {
      session.close()
    });
  }
}