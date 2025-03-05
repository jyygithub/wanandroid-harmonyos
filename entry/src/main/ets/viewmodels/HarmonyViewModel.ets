import { rcp } from '@kit.RemoteCommunicationKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { Harmony } from '../models/Harmony';
import ApiRepo from '../models/ApiRepo';

@ObservedV2
export default class HarmonyViewModel {
  @Trace data: Harmony | undefined
  @Trace isRefreshing: boolean = false

  fetchData() {
    const getURL = `https://wanandroid.com/harmony/index/json`;
    const session = rcp.createSession();
    session.get(getURL).then((response) => {
      console.info(`Response succeeded: ${JSON.stringify(response)}`);
      let result = JSON.parse(JSON.stringify(response)) as ApiRepo<Harmony>
      this.data = result.data
    }).catch((err: BusinessError) => {
      console.error(`Response err: Code is ${JSON.stringify(err.code)}, message is ${JSON.stringify(err)}`);
    }).finally(() => {
      session.close()
    });
  }
}