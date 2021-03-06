//
//  PlayerViewModel.m
//  KBSongPlayer
//
//  Created by 韩金波 on 15/11/25.
//  Copyright © 2015年 Psylife. All rights reserved.
//

#import "PlayerViewModel.h"

@implementation PlayerViewModel

-(void)getSongInfoBy:(SongInfoModel *)model
{
    NSString *ts=[PublicClass getTimestamp];
    NSString *url=[NSString stringWithFormat:Play_SongLink_Url,ts,model.song_id,e];
    
    [KBHttpNetWorking httpJsonRequestNetWorkingWithUrlStr:url success:^(id returnData){
        NSDictionary *dict=[returnData objectForKey:@"songinfo"];
        InfoModel *model1=[[InfoModel alloc] init];
        [model1 setValuesForKeysWithDictionary:dict];
        NSMutableArray *urlArr=[NSMutableArray array];
        NSArray *arr=[[returnData objectForKey:@"songurl"] objectForKey:@"url"];
        for (NSDictionary *sub in arr) {
            UrlModel *mo=[[UrlModel alloc] init];
            [mo setValuesForKeysWithDictionary:sub];
            [urlArr addObject:mo];
        }
        model1.UrlArr=urlArr;
        self.returnBlock(model1);
    }fail:^(){
        self.failureBlock();
    }];
}


@end
