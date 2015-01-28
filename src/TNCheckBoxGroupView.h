//
//  TNCheckBoxGroupView.h
//  Misuratore
//
//  Created by MartinPham on 1/28/15.
//  Copyright (c) 2015 Fornace. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TNCheckBoxGroup.h"

@protocol TNCheckBoxGroupViewDelegate <NSObject>
- (void)TNCheckBoxGroupView:(id)controller didChange:(NSArray*)selected;
@end

@interface TNCheckBoxGroupView : UIView
@property id<TNCheckBoxGroupViewDelegate> delegate;
@property  BOOL _single; // single vs multiple
@property (nonatomic, copy) NSString* _items; // id1@lbl1@1|id2@lbl2@0|id3@lbl3@1,..
@property (nonatomic, copy) NSString* _images; // checked|unchecked..
@property TNCheckBoxGroup *group;
@end
