//约束轮播图的数据格式
export class  SwiperDataModel{
  _id:string = "";
  goods_id:number = 0;
  image_src:string = "";
  navigator:string = "";
  open_type:string = "";
}

//约束活动列表的数据格式
export class ActivityDataModel{
  _id:string = "";
  image_src:string = "";
  name:string = "";
  navigator_url:string = "";
  open_type:string = "";
}