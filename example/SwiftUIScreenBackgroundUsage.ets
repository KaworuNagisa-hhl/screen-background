import { SwiftUIScreenBackground } from 'screen-background'

@Component
export struct SwiftUIScreenBackgroundUsage {
  build() {
    Stack() {
      SwiftUIScreenBackground()
      Text('Content over the screen background')
        .fontSize(16)
        .fontColor('#F8F8F8')
    }
    .width('100%')
    .height('100%')
  }
}
