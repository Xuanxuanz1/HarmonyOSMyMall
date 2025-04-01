import {BasicConstants} from "../Constants/BasicConstants"

@Component
export struct Personal{
  build() {
    Column(){
      Text("Personal")
        .fontSize(BasicConstants.FONT_SIZE_LARGE)
    }
    .width(BasicConstants.FULL_WIDTH)
    .height(BasicConstants.FULL_HEIGHT)
  }
}