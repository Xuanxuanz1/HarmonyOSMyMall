import {BaseConstants,BreakPointConstants} from "@ohos/common"

//搜索框
@Builder function searchTitle(){
  Column(){
    Flex({justifyContent:FlexAlign.SpaceBetween}){
      Image($r("app.media.ic_shop"))
        .height(BaseConstants.FULL_HEIGHT)

      Image($r("app.media.ic_scan"))
        .height(BaseConstants.FULL_HEIGHT)
    }
    .height(24)
    .width(BaseConstants.FULL_WIDTH)
    .margin({bottom:8})

    //搜索框
    Row(){
      Image($r('app.media.ic_search'))
        .width(20)
        .height(20)
        .margin({ left:12})
    }
    .height(40)
    .width(BaseConstants.FULL_WIDTH)
    .backgroundColor(Color.White)
    .borderRadius(20)

  }
}

//轮播图
@Builder function mySwiper(array:Array<string>,currentBreakpoint:string){
  Swiper(){
    ForEach(array,(item:string,index:number)=>{
      Image(item)
        .width(BaseConstants.FULL_WIDTH)
        .height(160)
        .objectFit(ImageFit.Auto)
    },(item:string)=>item)
  }
  .indicator(true)
  .itemSpace(currentBreakpoint === BreakPointConstants.BREAKPOINT_SM ? 0 : 10)
  .width(BaseConstants.FULL_WIDTH)
  .autoPlay(true)
  .borderRadius(16)
  .margin({top:20})
  .displayCount(currentBreakpoint === BreakPointConstants.BREAKPOINT_LG ? 3
    : currentBreakpoint === BreakPointConstants.BREAKPOINT_MD ? 2
    :1
  )
}

@Component
export struct MainPage {
  @State message: string = 'home page';
  @State swiperData:Array<string> = [
    "https://img1.baidu.com/it/u=618198938,827257638&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=1271",
    "https://img1.baidu.com/it/u=815647100,262077555&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=1422",
    "https://pic.rmb.bdstatic.com/bjh/240225/1e6160149c521693c97a5b738084d4ac1636.jpeg@h_1280",
    "https://img2.huashi6.com/images/resource/thumbnail/2024/03/09/198_74823769031.jpg?imageMogr2/quality/100/interlace/1/thumbnail/2000x%3E",
    "https://img0.baidu.com/it/u=3353312532,1125758586&fm=253&fmt=auto?w=800&h=1200"
  ]

  @StorageProp("currentBreakpoint") currentBreakpoint:string = "sm"

  build() {
    Column(){
      Stack({alignContent:Alignment.Top}){
      //   //层叠Model背景
        Image($r('app.media.bg_blue'))
          .width(BaseConstants.FULL_WIDTH)
          .height(202)
          .objectFit(ImageFit.Auto)

        Flex({direction:FlexDirection.Column}){
          //搜索model
          searchTitle()

          //轮播图model
          mySwiper(this.swiperData,this.currentBreakpoint)

          //楼层model

          //商品列表model
        }
        .padding({
          left:12,
          right:12,
          top:10
        })
      }
    }
    .backgroundColor($r("app.color.bg_color"))
    .width(BaseConstants.FULL_WIDTH)
    .justifyContent(FlexAlign.Start)
    .alignItems(HorizontalAlign.Start)
    .height(BaseConstants.FULL_HEIGHT)
  }
}
