import { rcp } from '@kit.RemoteCommunicationKit';
import { BusinessError } from '@kit.BasicServicesKit';
import ApiRepo from '../models/ApiRepo';
import PageRepo from '../models/PageRepo';
import CoinHistory from '../models/CoinHistory';

@ObservedV2
export default class CoinsHistoryViewModel {
  @Trace result: Array<CoinHistory> = []
  @Trace isRefreshing: boolean = false

  fetchData(cookies : string) {
    this.isRefreshing = true
    const getURL = `https://www.wanandroid.com//lg/coin/list/1/json`;
    const session = rcp.createSession({
      cookies: {
        "cookies": cookies
      }
    });
    session.get(getURL).then((response) => {
      console.info(`Response succeeded: ${JSON.stringify(response)}`);
      let result = JSON.parse(JSON.stringify(response)) as ApiRepo<PageRepo<CoinHistory>>
      this.result = result.data?.datas ?? []
    }).catch((err: BusinessError) => {
      console.error(`Response err: Code is ${JSON.stringify(err.code)}, message is ${JSON.stringify(err)}`);
    }).finally(() => {
      this.isRefreshing = false
      session.close()
    });
  }
}