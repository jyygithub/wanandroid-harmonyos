import { rcp } from '@kit.RemoteCommunicationKit';
import { BusinessError } from '@kit.BasicServicesKit';
import ApiRepo from '../models/ApiRepo';
import { User } from '../models/User';

@ObservedV2
export default class UserViewModel {
  @Trace user: User | undefined
  @Trace isRefreshing: boolean = false

  fetchTree() {
    this.isRefreshing = true
    const getURL = `https://wanandroid.com//user/lg/userinfo/json`;
    const session = rcp.createSession();
    session.get(getURL).then((response) => {
      console.info(`Response succeeded: ${JSON.stringify(response)}`);
      let result = JSON.parse(JSON.stringify(response)) as ApiRepo<User>
      this.user = result.data
    }).catch((err: BusinessError) => {
      console.error(`Response err: Code is ${JSON.stringify(err.code)}, message is ${JSON.stringify(err)}`);
    }).finally(() => {
      this.isRefreshing = false
      session.close()
    });
  }
}