import { rcp } from '@kit.RemoteCommunicationKit';
import { BusinessError } from '@kit.BasicServicesKit';
import Article from '../models/Article';
import ApiRepo from '../models/ApiRepo';
import PageRepo from '../models/PageRepo';

@ObservedV2
export default class RegisterViewModel {
  register(email: string, password: string) {
    const getURL = `https://www.wanandroid.com/user/register`;
    const session = rcp.createSession();
    session.post(getURL, {
      username: email,
      password: password,
      repassword: password,
    }).then((response) => {
      console.info(`Response succeeded: ${JSON.stringify(response)}`);
    }).catch((err: BusinessError) => {
      console.error(`Response err: Code is ${JSON.stringify(err.code)}, message is ${JSON.stringify(err)}`);
    }).finally(() => {
      session.close()
    });
  }
}