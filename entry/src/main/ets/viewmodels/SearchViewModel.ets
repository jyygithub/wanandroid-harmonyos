import { rcp } from '@kit.RemoteCommunicationKit';
import { BusinessError } from '@kit.BasicServicesKit';
import ApiRepo from '../models/ApiRepo';
import PageRepo from '../models/PageRepo';
import Coin from '../models/Coin';
import HotKey from '../models/HotKey';

@ObservedV2
export default class SearchViewModel {
  @Trace keys: HotKey[] = []
  @Trace isRefreshing: boolean = false

  fetchHotKey() {
    this.isRefreshing = true
    const getURL = `https://www.wanandroid.com/hotkey/json`;
    const session = rcp.createSession();
    session.get(getURL).then((response) => {
      console.info(`Response succeeded: ${JSON.stringify(response)}`);
      let result = JSON.parse(JSON.stringify(response)) as ApiRepo<Array<HotKey>>
      this.keys = result.data ?? []
    }).catch((err: BusinessError) => {
      console.error(`Response err: Code is ${JSON.stringify(err.code)}, message is ${JSON.stringify(err)}`);
    }).finally(() => {
      this.isRefreshing = false
      session.close()
    });
  }
}