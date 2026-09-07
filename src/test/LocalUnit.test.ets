import { describe, it, expect } from '@ohos/hypium'
import { getSwiftUIPalette, SwiftUITone } from 'theme'

export default function localUnitTest() {
  describe('SwiftUIScreenBackground', () => {
    it('provides_layer_colors_for_glass_surfaces', 0, () => {
      const palette = getSwiftUIPalette(SwiftUITone.CareGreen)
      expect(palette.background.toString()).assertContain('#')
      expect(palette.surfaceBlue.toString()).assertContain('#')
      expect(palette.surfaceAmber.toString()).assertContain('#')
    })
  })
}
