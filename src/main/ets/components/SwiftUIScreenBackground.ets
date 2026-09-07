import { getSwiftUIPalette, swiftUIColorWithOpacity, SwiftUITone } from 'theme'

@Component
export struct SwiftUIScreenBackground {
  @Prop tone: SwiftUITone = SwiftUITone.GlassBlack
  @Prop componentWidth: Length = '100%'
  @Prop componentHeight: Length = '100%'
  @Prop customBackgroundColor: ResourceColor = '#00000000'
  @Prop topGlowColor: ResourceColor = '#00000000'
  @Prop middleGlowColor: ResourceColor = '#00000000'
  @Prop accentGlowColor: ResourceColor = '#00000000'
  @Prop showDecorations: boolean = true

  private resolvedBackgroundColor(): ResourceColor {
    return this.customBackgroundColor === '#00000000' ? getSwiftUIPalette(this.tone).background : this.customBackgroundColor
  }

  private resolvedTopGlowColor(): ResourceColor {
    return this.topGlowColor === '#00000000' ? getSwiftUIPalette(this.tone).surfaceBlue : this.topGlowColor
  }

  private resolvedMiddleGlowColor(): ResourceColor {
    return this.middleGlowColor === '#00000000' ? getSwiftUIPalette(this.tone).surfaceMuted : this.middleGlowColor
  }

  private resolvedAccentGlowColor(): ResourceColor {
    return this.accentGlowColor === '#00000000' ? getSwiftUIPalette(this.tone).surfaceAmber : this.accentGlowColor
  }

  build() {
    Stack({ alignContent: Alignment.TopStart }) {
      Row()
        .width('100%')
        .height('100%')
        .backgroundColor(this.resolvedBackgroundColor())

      if (this.showDecorations) {
        Row()
          .width('100%')
          .height(300)
          .linearGradient({
            direction: GradientDirection.RightBottom,
            colors: [
              [swiftUIColorWithOpacity(getSwiftUIPalette(this.tone).backgroundElevated, 0.88), 0.0],
              [swiftUIColorWithOpacity(this.resolvedBackgroundColor(), 0.96), 0.42],
              [swiftUIColorWithOpacity(this.resolvedTopGlowColor(), 0.24), 0.76],
              [swiftUIColorWithOpacity(this.resolvedBackgroundColor(), 0.0), 1.0]
            ]
          })

        Row()
          .width('100%')
          .height(92)
          .backgroundColor(this.resolvedTopGlowColor())
          .opacity(0.18)
          .translate({ y: -34 })

        Row()
          .width(190)
          .height(860)
          .backgroundColor(this.resolvedMiddleGlowColor())
          .opacity(0.16)
          .rotate({ angle: -12 })
          .translate({ x: -130, y: 320 })

        Row()
          .width(210)
          .height(520)
          .backgroundColor(this.resolvedAccentGlowColor())
          .opacity(0.13)
          .rotate({ angle: 14 })
          .translate({ x: 330, y: 420 })

        Row()
          .width('100%')
          .height(120)
          .linearGradient({
            direction: GradientDirection.Right,
            colors: [
              [swiftUIColorWithOpacity(this.resolvedAccentGlowColor(), 0.0), 0.0],
              [swiftUIColorWithOpacity(this.resolvedAccentGlowColor(), 0.16), 0.44],
              [swiftUIColorWithOpacity(getSwiftUIPalette(this.tone).accent, 0.10), 1.0]
            ]
          })
          .rotate({ angle: -4 })
          .translate({ y: 560 })
      }
    }
    .width(this.componentWidth)
    .height(this.componentHeight)
  }
}
