import { rcp } from '@kit.RemoteCommunicationKit';
import { BusinessError } from '@kit.BasicServicesKit';
import ApiRepo from '../models/ApiRepo';
import PageRepo from '../models/PageRepo';
import Coin from '../models/Coin';

@ObservedV2
export default class CoinsViewModel {
  @Trace coins: Coin[] = []
  @Trace isRefreshing: boolean = false

  fetchCoins() {
    this.isRefreshing = true
    const getURL = `https://www.wanandroid.com/coin/rank/1/json`;
    const session = rcp.createSession();
    session.get(getURL).then((response) => {
      console.info(`Response succeeded: ${JSON.stringify(response)}`);
      let result = JSON.parse(JSON.stringify(response)) as ApiRepo<PageRepo<Coin>>
      this.coins = result.data?.datas ?? []
    }).catch((err: BusinessError) => {
      console.error(`Response err: Code is ${JSON.stringify(err.code)}, message is ${JSON.stringify(err)}`);
    }).finally(() => {
      this.isRefreshing = false
      session.close()
    });
  }
}