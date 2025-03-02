import { CourseView } from './index/CourseView';
import { ExploreView } from './index/ExploreView';
import { HarmonyView } from './index/HarmonyView';
import { HomeView } from './index/HomeView';
import { MineView } from './index/MineView';

@Entry
@ComponentV2
struct Index {
  @Local currentIndex: number = 0;
  pageInfos: NavPathStack = new NavPathStack();

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
    Navigation(this.pageInfos) {
      Tabs({ barPosition: BarPosition.End }) {
        TabContent() {
          HomeView({ pageInfos: this.pageInfos })
        }
        .tabBar(this.tabBuilder('首页', 0, $r('app.media.app_icon'), $r('app.media.app_icon')))

        TabContent() {
          ExploreView({ pageInfos: this.pageInfos })
        }
        .tabBar(this.tabBuilder('探索', 1, $r('app.media.app_icon'), $r('app.media.app_icon')))

        TabContent() {
          HarmonyView({ pageInfos: this.pageInfos })
        }
        .tabBar(this.tabBuilder('鸿蒙', 2, $r('app.media.app_icon'), $r('app.media.app_icon')))

        TabContent() {
          CourseView({ pageInfos: this.pageInfos })
        }
        .tabBar(this.tabBuilder('教程', 3, $r('app.media.app_icon'), $r('app.media.app_icon')))

        TabContent() {
          MineView({ pageInfos: this.pageInfos })
        }
        .tabBar(this.tabBuilder('我的', 4, $r('app.media.app_icon'), $r('app.media.app_icon')))
      }
      .barBackgroundColor($r('app.color.page'))
      .height('100%')
      .width('100%')
    }
    .hideTitleBar(true)
  }
}
