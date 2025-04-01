import {BreakPointConstants} from "../Constants/BreakPointConstants"
import { mediaquery } from "@kit.ArkUI"

export class BreakPointSystem{
  //媒体查询，得到单位后要保存全局，currentBreakPonit作为Key
  private currentBreakPoint:string = BreakPointConstants.BREAKPOINT_SM

  private smListener = mediaquery.matchMediaSync(BreakPointConstants.RANGE_SM)
  private mdListener = mediaquery.matchMediaSync(BreakPointConstants.RANGE_MD)
  private lgListener = mediaquery.matchMediaSync(BreakPointConstants.RANGE_LG)
  private xlListener = mediaquery.matchMediaSync(BreakPointConstants.RANGE_XL)


  //定义一个公共函数，用于保存当前屏幕的检测结果单位
  private updateCurrentBreakPonit(breakponit:string){
    if (this.currentBreakPoint !== breakponit) {
      this.currentBreakPoint = breakponit

      //应用级别的存储
      AppStorage.setOrCreate<String>(BreakPointConstants.CURRENT_BREAKPOINT,this.currentBreakPoint)
    }
  }

  //给监听器绑定change事件
  private isBreakPonitSM = (mediaQueryResult:mediaquery.MediaQueryResult)=>{
    if (mediaQueryResult.matches) {
      //将sm单位保存起来
      this.updateCurrentBreakPonit(BreakPointConstants.BREAKPOINT_SM)
    }
  }

  private isBreakPonitMD = (mediaQueryResult:mediaquery.MediaQueryResult)=>{
    if (mediaQueryResult.matches) {
      //将md单位保存起来
      this.updateCurrentBreakPonit(BreakPointConstants.BREAKPOINT_MD)
    }
  }

  private isBreakPonitLG = (mediaQueryResult:mediaquery.MediaQueryResult)=>{
    if (mediaQueryResult.matches) {
      //将lg单位保存起来
      this.updateCurrentBreakPonit(BreakPointConstants.BREAKPOINT_LG)
    }
  }

  private isBreakPonitXL = (mediaQueryResult:mediaquery.MediaQueryResult)=>{
    if (mediaQueryResult.matches) {
      //将xl单位保存起来
      this.updateCurrentBreakPonit(BreakPointConstants.BREAKPOINT_XL)
    }
  }

  //绑定监听器
  public register(){
    this.smListener = mediaquery.matchMediaSync(BreakPointConstants.RANGE_SM)
    this.smListener.on("change",this.isBreakPonitSM)
    this.mdListener = mediaquery.matchMediaSync(BreakPointConstants.RANGE_MD)
    this.mdListener.on("change",this.isBreakPonitMD)
    this.lgListener = mediaquery.matchMediaSync(BreakPointConstants.RANGE_LG)
    this.lgListener.on("change",this.isBreakPonitLG)
    this.xlListener = mediaquery.matchMediaSync(BreakPointConstants.RANGE_XL)
    this.xlListener.on("change",this.isBreakPonitXL)

  }

  //解绑监听器
  public unregister(){
    this.smListener.off("change",this.isBreakPonitSM)
    this.mdListener.off("change",this.isBreakPonitMD)
    this.lgListener.off("change",this.isBreakPonitLG)
    this.xlListener.off("change",this.isBreakPonitXL)
  }
}