import { rcp } from '@kit.RemoteCommunicationKit';
import { BusinessError } from '@kit.BasicServicesKit';

@ObservedV2
export default class EditCollectArticleViewModel {
  collect(id: number, title: string, author: string, link: string, cookies: string) {
    const getURL = `https://wanandroid.com/lg/collect/user_article/update/${id}/json`;
    const session = rcp.createSession({
      headers: {
        "Content-Type": "application/x-www-form-urlencoded"
      },
      cookies: {
        "cookies": cookies
      }
    });
    session.post(getURL, `title=${title}&author=${author}&link=${link}`).then((response) => {
      console.info(`Response succeeded: ${JSON.stringify(response)}`);
    }).catch((err: BusinessError) => {
      console.error(`Response err: Code is ${JSON.stringify(err.code)}, message is ${JSON.stringify(err)}`);
    }).finally(() => {
      session.close()
    });
  }
}