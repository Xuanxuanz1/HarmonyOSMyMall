import {add,EmptyView,BreakPointSystem} from "@ohos/common"
import {BasicConstants} from "../Constants/BasicConstants"
import {MainPage} from "@ohos/homelibrary"
import {Product} from "../view/Product"
import {Cart} from "../view/Cart"
import {Personal} from "../view/Personal"

@Entry
@Component
struct Index {
  @State message: string = 'Entry Index';

  private breakPointSystem = new BreakPointSystem();
  @StorageProp("currentBreakpoint") currentBreakPoint:string = "sm"

  @State currentIndex:number = 0;
  private tabsController = new TabsController();

  aboutToAppear(): void {
    //进入页面注册绑定监听器
    this.breakPointSystem.register()
  }

  aboutToDisappear(): void {
    this.breakPointSystem.unregister()
  }

  //函数存放的是布局代码
  @Builder tabBuilder(title:string,targetIndex:number,selectImg:Resource,normalImg:Resource){
    Column({space:3}){
      Image(this.currentIndex == targetIndex ? selectImg : normalImg)
        .size({width:25,height:25})

      Text(title)
        .fontColor(this.currentIndex === targetIndex ? "#1296db" : Color.Black)
    }
    .width("100%")
    .height(50)
    .justifyContent(FlexAlign.Center)
    .onClick(()=>{
      this.currentIndex = targetIndex;
      this.tabsController.changeIndex(targetIndex);//控制器下标也更新，控制显示页面更新
    })
  }

  build() {
    Column(){
      Tabs({
        barPosition:this.currentBreakPoint == "lg" ? BarPosition.Start : BarPosition.End,
        controller:this.tabsController
      }){
        TabContent(){
          MainPage()
        }
        .tabBar(this.tabBuilder("首页",0,$r("app.media.main_click"),$r("app.media.main_normal")))

        TabContent(){
          Product()
        }
        .tabBar(this.tabBuilder("产品",1,$r("app.media.main_click"),$r("app.media.main_normal")))

        TabContent(){
          Cart()
        }
        .tabBar(this.tabBuilder("购物车",2,$r("app.media.main_click"),$r("app.media.main_normal")))

        TabContent(){
          Personal()
        }
        .tabBar(this.tabBuilder("我的",3,$r("app.media.main_click"),$r("app.media.main_normal")))

      }
      //用于滑动的时候，触发更新
      .onChange((index:number)=>{
        this.currentIndex = index;
      })
      .vertical(this.currentBreakPoint == "lg" ? true : false)
      .barHeight(this.currentBreakPoint === "lg" ? 300 : 80)
    }
    .height(BasicConstants.FULL_HEIGHT)
    .width(BasicConstants.FULL_WIDTH)
    .backgroundColor($r("app.color.bg_color"))
  }
}