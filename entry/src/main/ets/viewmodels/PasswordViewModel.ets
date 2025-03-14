import { rcp } from '@kit.RemoteCommunicationKit';
import { BusinessError } from '@kit.BasicServicesKit';

@ObservedV2
export default class PasswordViewModel {
  @Trace cookies: string = ''

  changePassword(oldPassword: string, newPassword1: string, newPassword2: string, cookies: string) {
    const getURL = `https://www.wanandroid.com/user/login`;
    const session = rcp.createSession({
      headers: {
        "Content-Type": "application/x-www-form-urlencoded"
      },
      cookies: {
        "cookies": cookies
      }
    });
    session.post(getURL, `oldPassword=${oldPassword}&newPassword1=${newPassword1}&newPassword2=${newPassword2}`).then((response) => {
      console.info(`Response succeeded: ${JSON.stringify(response.cookies)}`);
      console.info(`Response succeeded: ${JSON.stringify(response)}`);
    }).catch((err: BusinessError) => {
      console.error(`Response err: Code is ${JSON.stringify(err.code)}, message is ${JSON.stringify(err)}`);
    }).finally(() => {
      session.close()
    });
  }
}