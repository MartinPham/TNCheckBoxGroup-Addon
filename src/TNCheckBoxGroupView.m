//
//  TNCheckBoxGroupView.m
//  Misuratore
//
//  Created by MartinPham on 1/28/15.
//  Copyright (c) 2015 Fornace. All rights reserved.
//

#import "TNCheckBoxGroupView.h"

@implementation TNCheckBoxGroupView

- (id)initWithCoder:(NSCoder*)coder {
	if(self = [super initWithCoder:coder]) {
		// Do something
		[self initView];
	}
	return self;
}

- (id)initWithFrame:(CGRect)frame {
	if(self = [super initWithFrame:frame]) {
		// Do something
		[self initView];
	}
	return self;
}


- (BOOL)single {
	return self._single;
}

- (void)setSingle:(BOOL)single {
	self._single = single;
}



- (NSString *)items {
	return self._items;
}

- (void)setItems:(NSString *)items {
	NSLog(@"si");
	NSArray *idsArray = [items componentsSeparatedByString:@"|"];
	NSMutableArray *itemsArray = [NSMutableArray array];
	for(NSString *item in idsArray){
		NSArray *itemArray = [item componentsSeparatedByString:@"@"];
		if(self._single){
			TNCircularCheckBoxData *checkbox = [[TNCircularCheckBoxData alloc] init];
			checkbox.identifier = itemArray[0];
			checkbox.labelText = itemArray[1];
			checkbox.checked = [itemArray[2] isEqualToString:@"1"] ? YES : NO;
			
			[itemsArray addObject:checkbox];
		}else{
			TNRectangularCheckBoxData *checkbox = [[TNRectangularCheckBoxData alloc] init];
			checkbox.identifier = itemArray[0];
			checkbox.labelText = itemArray[1];
			checkbox.checked = [itemArray[2] isEqualToString:@"1"] ? YES : NO;
			
			[itemsArray addObject:checkbox];
		}
		
		
	}
	self.group = [[TNCheckBoxGroup alloc] initWithCheckBoxData:itemsArray style:TNCheckBoxLayoutHorizontal];
	[self.group create];
	self.group.position = self.frame.origin;
	[self addSubview:self.group];
	
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(valueChanged:) name:GROUP_CHANGED object:self.group];

	
	self._items = items;
}

- (void)dealloc {
	[[NSNotificationCenter defaultCenter] removeObserver:self name:GROUP_CHANGED object:self.group];
}

- (void)valueChanged:(NSNotification *)notification {
	if(self._single){
		for(TNCheckBoxData *item in self.group.checkedCheckBoxes){
			item.checked = NO;
			[((TNCircularCheckBox*)item.checkbox) checkWithAnimation:YES];
			
		}
		
		TNCircularCheckBox*item = (TNCircularCheckBox*)self.group.lastChangeItem;
		
		item.data.checked = YES;
		
		[item checkWithAnimation:YES];
		
		
	}else{
		
	}
	
	
	NSArray *selected = self.group.checkedCheckBoxes;
	
	
	NSMutableArray *selectedItems = [NSMutableArray array];
	
	for(TNCheckBoxData *item in selected){
		[selectedItems addObject:item.identifier];
	}
	
	[self.delegate TNCheckBoxGroupView:self didChange:selectedItems];
}


- (NSString *)images {
	return self._images;
}

- (void)setImages:(NSString *)images {
	self._images = images;
}

- (void)initView {
	
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
