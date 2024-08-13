import { rcp } from '@kit.RemoteCommunicationKit';
import { BusinessError } from '@kit.BasicServicesKit';
import Article from '../models/Article';
import ApiRepo from '../models/ApiRepo';
import PageRepo from '../models/PageRepo';
import Course from '../models/Course';

@ObservedV2
export default class CourseViewModel {
  @Trace courses: Array<Course> = []
  @Trace isRefreshing: boolean = false

  fetchCourses() {
    this.isRefreshing = true
    const getURL = `https://www.wanandroid.com/chapter/547/sublist/json`;
    const session = rcp.createSession();
    session.get(getURL).then((response) => {
      console.info(`Response succeeded: ${JSON.stringify(response)}`);
      let result = JSON.parse(JSON.stringify(response)) as ApiRepo<Array<Course>>
      this.courses = result.data ?? []
    }).catch((err: BusinessError) => {
      console.error(`Response err: Code is ${JSON.stringify(err.code)}, message is ${JSON.stringify(err)}`);
    }).finally(() => {
      this.isRefreshing = false
      session.close()
    });
  }
}