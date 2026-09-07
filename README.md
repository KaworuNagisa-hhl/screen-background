# screen-background

`screen-background` 是一个 OpenHarmony/HarmonyOS ArkUI like-ios 页面背景组件，适合作为业务页面底层背景。默认提供黑色优先的纯色毛玻璃背景、柔和顶部光感和低干扰装饰层；业务方可自定义背景色、宽高、光感颜色，并可关闭装饰层。

## 实际运行效果

下面展示页面背景、柔和光感和承载内容后的整体视觉：

![screen background preview](https://cdn.jsdelivr.net/gh/KaworuNagisa-hhl/screen-background@main/docs/screen-background-preview.gif)

## 安装

```bash
ohpm install screen-background
```

本地源码依赖：

```json5
{
  "dependencies": {
    "screen-background": "file:../screen-background",
    "theme": "file:../theme"
  }
}
```

## 正常使用样式

```ts
import { SwiftUIScreenBackground } from 'screen-background'
import { SwiftUITone } from 'theme'

@Component
struct CareOverviewPage {
  build() {
    Stack() {
      SwiftUIScreenBackground({
        tone: SwiftUITone.GlassBlack
      })

      Column() {
        Text('页面内容')
      }
      .width('100%')
      .height('100%')
      .padding(16)
    }
    .width('100%')
    .height('100%')
  }
}
```

## 自定义品牌样式

```ts
SwiftUIScreenBackground({
  componentWidth: '100%',
  componentHeight: '100%',
  customBackgroundColor: '#0B0B0C',
  topGlowColor: '#242424',
  middleGlowColor: '#1A1A1A',
  accentGlowColor: '#303030',
  showDecorations: true
})
```

## API

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| `tone` | `SwiftUITone` | `GlassBlack` | 默认 like-ios 黑色毛玻璃色调 |
| `componentWidth` | `Length` | `'100%'` | 背景宽度 |
| `componentHeight` | `Length` | `'100%'` | 背景高度 |
| `customBackgroundColor` | `ResourceColor` | 自动背景 | 页面底色 |
| `topGlowColor` | `ResourceColor` | 自动色调 | 顶部光感颜色 |
| `middleGlowColor` | `ResourceColor` | 自动色调 | 中段装饰色 |
| `accentGlowColor` | `ResourceColor` | 自动色调 | 强调装饰色 |
| `showDecorations` | `boolean` | `true` | 是否显示装饰层 |
