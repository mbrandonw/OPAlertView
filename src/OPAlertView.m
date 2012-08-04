// OPEnumerable
//
// Copyright (c) 2012 Brandon Williams (http://www.opetopic.com)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "OPAlertView.h"

@interface OPAlertView (/*Private*/) <UIAlertViewDelegate>
@property (nonatomic, strong) NSMutableArray *buttonHandlers;
@property (nonatomic, strong) void(^cancelHandler)(UIAlertView*);
@end

@implementation OPAlertView

-(id) initWithTitle:(NSString *)title message:(NSString *)message {
    if (! (self = [self initWithTitle:title message:message delegate:nil cancelButtonTitle:nil otherButtonTitles:nil]))
        return nil;
    
    self.delegate = self;
    self.buttonHandlers = [NSMutableArray new];
    
    return self;
}

-(NSInteger) addButtonWithTitle:(NSString *)title {
    return [self addButtonWithTitle:title handler:nil];
}

-(NSInteger) addButtonWithTitle:(NSString*)title handler:(void(^)(OPAlertView *alertView))handler {
    
    [self.buttonHandlers addObject:(id)handler ?: [NSNull null]];
    return [super addButtonWithTitle:title];
}

-(NSInteger) setCancelButtonWithTitle:(NSString*)title handler:(void(^)(OPAlertView *alertView))handler {
    self.cancelButtonIndex = [self addButtonWithTitle:title handler:handler];
    return self.cancelButtonIndex;
}

-(void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    void(^handler)(UIAlertView*);
    handler = [self.buttonHandlers objectAtIndex:buttonIndex];
    if ((NSNull*)handler != [NSNull null])
        handler(self);
}

@end
