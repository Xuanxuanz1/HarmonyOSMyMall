import {BaseConstants,BreakPointConstants} from "@ohos/common"
import {ActivityDataModel,SwiperDataModel} from "../viewmodel/HomeModel"

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

@Component
export struct MainPage {
  @State message: string = 'home page';
  // @State swiperData:Array<string> = [
  //   "https://img1.baidu.com/it/u=618198938,827257638&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=1271",
  //   "https://img1.baidu.com/it/u=815647100,262077555&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=1422",
  //   "https://pic.rmb.bdstatic.com/bjh/240225/1e6160149c521693c97a5b738084d4ac1636.jpeg@h_1280",
  //   "https://img2.huashi6.com/images/resource/thumbnail/2024/03/09/198_74823769031.jpg?imageMogr2/quality/100/interlace/1/thumbnail/2000x%3E",
  //   "https://img0.baidu.com/it/u=3353312532,1125758586&fm=253&fmt=auto?w=800&h=1200"
  // ]

  @State swiperData:Array<SwiperDataModel> = [
    {
      _id:"1",
      goods_id:1,
      image_src:"https://img1.baidu.com/it/u=618198938,827257638&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=1271",
      navigator:"xxx",
      open_type:"switchTab"
    },
    {
      _id:"2",
      goods_id:2,
      image_src:"https://img1.baidu.com/it/u=815647100,262077555&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=1422",
      navigator:"xxx",
      open_type:"switchTab"
    },
    {
      _id:"3",
      goods_id:3,
      image_src:"https://pic.rmb.bdstatic.com/bjh/240225/1e6160149c521693c97a5b738084d4ac1636.jpeg@h_1280",
      navigator:"xxx",
      open_type:"switchTab"
    },
    {
      _id:"4",
      goods_id:4,
      image_src:"https://img2.huashi6.com/images/resource/thumbnail/2024/03/09/198_74823769031.jpg?imageMogr2/quality/100/interlace/1/thumbnail/2000x%3E",
      navigator:"xxx",
      open_type:"switchTab"
    },
    {
      _id:"5",
      goods_id:5,
      image_src:"https://img0.baidu.com/it/u=3353312532,1125758586&fm=253&fmt=auto?w=800&h=1200",
      navigator:"xxx",
      open_type:"switchTab"
    }
  ]

  @StorageProp("currentBreakpoint") currentBreakpoint:string = "sm"

  @State activityTitle:Array<ActivityDataModel> = [
    {
      _id:"1",
      image_src:"https://img1.baidu.com/it/u=618198938,827257638&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=1271",
      name:"旅行日记",
      navigator_url:"xxx",
      open_type:"switchTab"
    },
    {
      _id:"2",
      image_src:"https://img1.baidu.com/it/u=618198938,827257638&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=1271",
      name:"旅行日记",
      navigator_url:"xxx",
      open_type:"switchTab"
    },
    {
      _id:"3",
      image_src:"https://img1.baidu.com/it/u=618198938,827257638&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=1271",
      name:"旅行日记",
      navigator_url:"xxx",
      open_type:"switchTab"
    }
  ]

  //轮播图
  @Builder mySwiper() {
    Swiper() {
      ForEach(this.swiperData, (item: SwiperDataModel, index: number) => {
        Image(item.image_src)
          .width(BaseConstants.FULL_WIDTH)
          .height(160)
          .objectFit(ImageFit.Auto)
      }, (item: SwiperDataModel) => item._id)
    }
    .indicator(true)
    .itemSpace(this.currentBreakpoint === BreakPointConstants.BREAKPOINT_SM ? 0 : 10)
    .width(BaseConstants.FULL_WIDTH)
    .autoPlay(true)
    .borderRadius(16)
    .margin({ top: 20 })
    .displayCount(this.currentBreakpoint === BreakPointConstants.BREAKPOINT_LG ? 3
      : this.currentBreakpoint === BreakPointConstants.BREAKPOINT_MD ? 2
      : 1
    )
  }

  @Builder myNav(){
    Grid(){
      ForEach(this.activityTitle,(item:ActivityDataModel,index:number)=>{
        GridItem(){
          Column(){
            Image(item.image_src)
              .width(60)
              .height(60)

            Text(item.name)
          }
        }
      },(item:ActivityDataModel)=>item._id)
    }
    .rowsTemplate("1fr 1fr")//2行
    .columnsTemplate("1fr 1fr 1fr 1fr")//4列
    // .layoutDirection(GridDirection.Column)
    .rowsGap(10)
    .columnsGap(10)
    .width(BaseConstants.FULL_WIDTH)
    .height(180)
    .border({
      width:1,
      color:Color.Red
    })
    .margin({top:20})
  }

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
          this.mySwiper()

          //楼层model
          this.myNav()

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
