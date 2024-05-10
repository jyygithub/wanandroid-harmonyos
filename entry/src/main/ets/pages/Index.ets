import { Course } from './index/Course';
import { Explore } from './index/Explore';
import { Home } from './index/Home';
import { Mine } from './index/Mine';

@Entry
@ComponentV2
struct Index {
  @Local currentIndex: number = 0;

  @Builder
  tabBuilder(title: string, targetIndex: number, selectedImg: Resource, normalImg: Resource) {
    Column({ space: 4 }) {
      Image(this.currentIndex === targetIndex ? selectedImg : normalImg)
        .size({ width: 25, height: 25 })
      Text(title)
        .fontColor(this.currentIndex === targetIndex ? '#1698CE' : '#6B6B6B')
        .fontSize(14)
    }
    .width('100%')
    .height(50)
    .justifyContent(FlexAlign.Center)
  }

  build() {
    Tabs({ barPosition: BarPosition.End }) {
      TabContent() {
        Home()
      }
      .tabBar(this.tabBuilder('首页', 0, $r('app.media.app_icon'), $r('app.media.app_icon')))

      TabContent() {
        Explore()
      }
      .tabBar(this.tabBuilder('探索', 0, $r('app.media.app_icon'), $r('app.media.app_icon')))

      TabContent() {
        Course()
      }
      .tabBar(this.tabBuilder('教程', 0, $r('app.media.app_icon'), $r('app.media.app_icon')))

      TabContent() {
        Mine()
      }
      .tabBar(this.tabBuilder('我的', 0, $r('app.media.app_icon'), $r('app.media.app_icon')))
    }
    .height('100%')
    .width('100%')
  }
}
