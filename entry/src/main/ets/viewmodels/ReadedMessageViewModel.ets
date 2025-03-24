import { rcp } from '@kit.RemoteCommunicationKit';
import { BusinessError } from '@kit.BasicServicesKit';
import ApiRepo from '../models/ApiRepo';
import PageRepo from '../models/PageRepo';
import Coin from '../models/Coin';
import Message from '../models/Message';

@ObservedV2
export default class ReadedMessageViewModel {
  @Trace messages: Message[] = []
  @Trace isRefreshing: boolean = false

  fetchCoins(page: number, cookies: string) {
    this.isRefreshing = true
    const getURL = `https://wanandroid.com/message/lg/readed_list/1/json`;
    const session = rcp.createSession({
      cookies: {
        "cookies": cookies
      }
    });
    session.get(getURL).then((response) => {
      console.info(`Response succeeded: ${JSON.stringify(response)}`);
      let result = JSON.parse(JSON.stringify(response)) as ApiRepo<PageRepo<Message>>
      this.messages = result.data?.datas ?? []
    }).catch((err: BusinessError) => {
      console.error(`Response err: Code is ${JSON.stringify(err.code)}, message is ${JSON.stringify(err)}`);
    }).finally(() => {
      this.isRefreshing = false
      session.close()
    });
  }
}