import Course from "../../models/Course"
import CourseViewModel from "../../viewmodels/CourseViewModel"

@ComponentV2
export struct CourseView {
  @Local viewModel: CourseViewModel = new CourseViewModel()

  aboutToAppear(): void {
    this.viewModel.fetchCourses()
  }

  build() {
    NavDestination() {
      Column() {
        Tabs({ barPosition: BarPosition.Start }) {
          ForEach(this.viewModel.courses, (item: Course) => {
            TabContent() {

            }.tabBar(item.name)
          })
        }
        .barMode(BarMode.Scrollable)
      }
    }
    .height('100%')
    .width('100%')
    .title('教程')
    .backgroundColor($r('app.color.page'))
  }
}