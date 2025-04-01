import mediaquery from "@ohos.mediaquery"

@Entry
@Component
struct Page01_media {
  @State message: string = '媒体查询技术';

  onPortrait = (mediaQueryResult:mediaquery.MediaQueryResult)=>{
    if (mediaQueryResult.matches) {
      //横屏
    }
    else {
      //竖屏
    }
  }

  //检测屏幕是否为横屏
  // private listener =  mediaquery.matchMediaSync('(orientation: landscape)');
  //宽度320vp-600vp
  private listener =  mediaquery.matchMediaSync('(320vp<=width<600vp)');

  aboutToAppear(): void {
    //给listener监听器绑定一个函数
    this.listener.on("change",this.onPortrait)
  }

  build() {
    Column(){
      Text(this.message)
    }
    .height('100%')
    .width('100%')
  }
}