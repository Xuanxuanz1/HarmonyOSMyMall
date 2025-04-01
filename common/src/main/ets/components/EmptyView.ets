@Component
export struct EmptyView{
  build() {
    Column(){
      Text("404 No Found!")
    }
    .width("100%")
    .height("100%")
  }
}