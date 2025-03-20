import { rcp } from '@kit.RemoteCommunicationKit';
import { BusinessError } from '@kit.BasicServicesKit';
import Article from '../models/Article';
import ApiRepo from '../models/ApiRepo';
import PageRepo from '../models/PageRepo';
import Comment from '../models/Comment';

@ObservedV2
export default class CommentsViewModel {
  @Trace conments: Array<Comment> = []
  @Trace isRefreshing: boolean = false

  fetchArticles(id : number) {
    this.isRefreshing = true
    const getURL = `https://wanandroid.com/wenda/comments/${id}/json`;
    const session = rcp.createSession();
    session.get(getURL).then((response) => {
      console.info(`Response succeeded: ${JSON.stringify(response)}`);
    }).catch((err: BusinessError) => {
      console.error(`Response err: Code is ${JSON.stringify(err.code)}, message is ${JSON.stringify(err)}`);
    }).finally(() => {
      this.isRefreshing = false
      session.close()
    });
  }
}