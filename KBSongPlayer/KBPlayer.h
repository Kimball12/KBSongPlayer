//
//  KBPlayer.h
//  KBSongPlayer
//
//  Created by 韩金波 on 15/11/23.
//  Copyright © 2015年 Psylife. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SongInfoModel.h"
#import "InfoModel.h"
#import "UrlModel.h"

@interface KBPlayer : NSObject
@property(nonatomic,copy)NSMutableArray *songArr;
@property(nonatomic,retain)InfoModel *currentModel;
@property(nonatomic,assign)NSInteger currentIndex;

+(KBPlayer*)manager;


-(void)playerSongsIndex:(NSInteger)index;
@end
