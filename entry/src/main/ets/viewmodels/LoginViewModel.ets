import { rcp } from '@kit.RemoteCommunicationKit';
import { BusinessError } from '@kit.BasicServicesKit';

@ObservedV2
export default class LoginViewModel {

  @Trace cookies : string = ''

  login(email: string, password: string) {
    const getURL = `https://www.wanandroid.com/user/login`;
    const session = rcp.createSession({
      headers: {
        "Content-Type": "application/x-www-form-urlencoded"
      }
    });
    session.post(getURL, `username=${email}&password=${password}`).then((response) => {
      console.info(`Response succeeded: ${JSON.stringify(response.cookies)}`);
      console.info(`Response succeeded: ${JSON.stringify(response)}`);
    }).catch((err: BusinessError) => {
      console.error(`Response err: Code is ${JSON.stringify(err.code)}, message is ${JSON.stringify(err)}`);
    }).finally(() => {
      session.close()
    });
  }
}