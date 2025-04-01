import {BasicConstants} from "../Constants/BasicConstants"

@Component
export struct Product{
  build() {
    Column(){
      Text("Product")
        .fontSize(BasicConstants.FONT_SIZE_LARGE)
    }
    .width(BasicConstants.FULL_WIDTH)
    .height(BasicConstants.FULL_HEIGHT)
  }
}