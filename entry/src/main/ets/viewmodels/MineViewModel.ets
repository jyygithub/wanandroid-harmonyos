import { rcp } from '@kit.RemoteCommunicationKit';
import { BusinessError } from '@kit.BasicServicesKit';
import Coin from '../models/Coin';
import ApiRepo from '../models/ApiRepo';

@ObservedV2
export default class MineViewModel {
  @Trace coininfo: Coin | undefined

  getMyCoin(cookies: string) {
    const getURL = `https://www.wanandroid.com/lg/coin/userinfo/json`;
    const session = rcp.createSession({
      cookies: {
        "cookies": cookies
      }
    });
    session.get(getURL).then((response) => {
      console.info(`Response succeeded: ${JSON.stringify(response.cookies)}`);
      console.info(`Response succeeded: ${JSON.stringify(response)}`);
      let result = JSON.parse(JSON.stringify(response)) as ApiRepo<Coin>
      this.coininfo = result.data
    }).catch((err: BusinessError) => {
      console.error(`Response err: Code is ${JSON.stringify(err.code)}, message is ${JSON.stringify(err)}`);
    }).finally(() => {
      session.close()
    });
  }
}