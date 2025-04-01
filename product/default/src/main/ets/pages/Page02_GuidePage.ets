import {BasicConstants} from "../Constants/BasicConstants"
import {router} from "@kit.ArkUI"
import {BreakPointSystem} from "@ohos/common"

@Entry
@Component
struct Page02_GuidePage {
  @State message: string = 'Hello World';
  @State count:number = 3;
  private timmer:number = 0;
  private breakPointSystem = new BreakPointSystem()
  @StorageProp("currentBreakpoint") currentBreakPoint:string = "sm"
  @State flag:number = 1;

  aboutToAppear(): void {
    //注册
    this.breakPointSystem.register()
    //计算屏幕倍数
    switch (this.currentBreakPoint){
      case "sm":
        this.flag *= 1;
        break;
      case "md":
        this.flag *= 1.1;
        break;
      case "lg":
        this.flag *= 1.2;
        break;
      case "xl":
        this.flag *= 1.8;
        break;
    }
    this.timmer = setInterval(()=>{
      this.count--;
      if (this.count == 0) {
        router.pushUrl({
          url:"pages/Index"
        })
      }
    },1000)
  }

  aboutToDisappear(): void {
    this.breakPointSystem.unregister()
    clearInterval(this.timmer)
  }

  build() {
    Stack(){
      Text(`倒计时:${this.count}`)

      Flex({
        direction:FlexDirection.Column,
        alignItems:ItemAlign.Center
      }){

        //LOGO
        Column(){
          Image($r("app.media.LOGOM"))
            .width(120 * this.flag)
            .borderRadius(10)
        }
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)
        .flexGrow(1)

        //标题
        Image($r("app.media.main_1"))
          .width(114 * this.flag)
          .height(27 * this.flag)


        Text("MyMall超市")
          .fontColor($r("app.color.GuideTitleColor"))
          .fontSize(20 * this.flag)
          .letterSpacing(16)
          .margin({
            top:12,
            bottom:136
          })
      }
      .width(BasicConstants.FULL_WIDTH)
      .height(BasicConstants.FULL_HEIGHT)
    }
  }
}