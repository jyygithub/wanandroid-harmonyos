import { rcp } from '@kit.RemoteCommunicationKit';
import { BusinessError } from '@kit.BasicServicesKit';

@ObservedV2
export default class EditCollectWebUrlViewModel {
  collect(id: number, name: string, link: string, cookies: string) {
    const getURL = `https://www.wanandroid.com/lg/collect/updatetool/json`;
    const session = rcp.createSession({
      headers: {
        "Content-Type": "application/x-www-form-urlencoded"
      },
      cookies: {
        "cookies": cookies
      }
    });
    session.post(getURL, `id=${id}&name=${name}&link=${link}`).then((response) => {
      console.info(`Response succeeded: ${JSON.stringify(response)}`);
    }).catch((err: BusinessError) => {
      console.error(`Response err: Code is ${JSON.stringify(err.code)}, message is ${JSON.stringify(err)}`);
    }).finally(() => {
      session.close()
    });
  }
}