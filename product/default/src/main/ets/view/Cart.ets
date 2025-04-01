import {BasicConstants} from "../Constants/BasicConstants"

@Component
export struct Cart{
  build() {
    Column(){
      Text("Cart")
        .fontSize(BasicConstants.FONT_SIZE_LARGE)
    }
    .width(BasicConstants.FULL_WIDTH)
    .height(BasicConstants.FULL_HEIGHT)
  }
}