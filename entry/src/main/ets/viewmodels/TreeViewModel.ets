import { rcp } from '@kit.RemoteCommunicationKit';
import { BusinessError } from '@kit.BasicServicesKit';
import Article from '../models/Article';
import ApiRepo from '../models/ApiRepo';
import PageRepo from '../models/PageRepo';
import Course from '../models/Course';

@ObservedV2
export default class TreeViewModel {
  @Trace trees: Array<Course> = []
  @Trace childTrees: Array<Course> = []
  @Trace isRefreshing: boolean = false

  fetchTree() {
    this.isRefreshing = true
    const getURL = `https://www.wanandroid.com/tree/json`;
    const session = rcp.createSession();
    session.get(getURL).then((response) => {
      console.info(`Response succeeded: ${JSON.stringify(response)}`);
      let result = JSON.parse(JSON.stringify(response)) as ApiRepo<Array<Course>>
      this.trees = result.data ?? []
      this.childTrees = this.trees[0].children
    }).catch((err: BusinessError) => {
      console.error(`Response err: Code is ${JSON.stringify(err.code)}, message is ${JSON.stringify(err)}`);
    }).finally(() => {
      this.isRefreshing = false
      session.close()
    });
  }
}