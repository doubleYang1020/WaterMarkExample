//
//  ViewController.m
//  WaterMarkExample
//
//  Created by huyangyang on 2018/3/19.
//  Copyright © 2018年 com.huyangyang.landscapePhotography. All rights reserved.
//

#import "ViewController.h"
#import <AVKit/AVKit.h>
#import "WatermarkEngine.h"
#import "MBProgressHUD.h"
@interface ViewController ()
@property (nonatomic ,strong) NSURL *inputFileUrl;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString* inputFilePath = [[NSBundle mainBundle] pathForResource:@"inputResources" ofType:@"mp4"];
    self.inputFileUrl = [NSURL fileURLWithPath:inputFilePath];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
-(void)playVideoWith:(NSURL *) inputURL{
    AVPlayer* player = [AVPlayer playerWithURL:inputURL];
    AVPlayerViewController* cor = [[AVPlayerViewController alloc] init];
    cor.player = player;
    [self presentViewController:cor animated:true completion:^{
        [cor.player play];
    }];
}

- (IBAction)previewVideo:(UIButton *)sender {
    
    [self playVideoWith:self.inputFileUrl];
}
- (IBAction)addWaterForCorAnimationType:(UIButton *)sender {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:true];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.label.text = @"loding";
    [WatermarkEngine addWaterMarkTypeWithCorAnimationAndInputVideoURL:self.inputFileUrl WithCompletionHandler:^(NSURL *outPutURL, int code) {
        [self playVideoWith:outPutURL];
        [hud hideAnimated:true];
    }];
}
- (IBAction)addWaterForLottieType:(id)sender {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:true];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.label.text = @"loding";
    [WatermarkEngine addWaterMarkTypeWithLottieAndInputVideoURL:self.inputFileUrl WithCompletionHandler:^(NSURL *outPutURL, int code) {
        [self playVideoWith:outPutURL];
        [hud hideAnimated:true];
    }];
}
- (IBAction)addWaterForGIfType:(id)sender {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:true];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.label.text = @"loding";
    [WatermarkEngine addWaterMarkTypeWithGIFAndInputVideoURL:self.inputFileUrl WithCompletionHandler:^(NSURL *outPutURL, int code) {
        [self playVideoWith:outPutURL];
        [hud hideAnimated:true];
    }];
}
- (IBAction)addWaterForGPUImageType1:(id)sender {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:true];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.label.text = @"loding";
    NSString* inputFilePath = [[NSBundle mainBundle] pathForResource:@"测试zhouzhou" ofType:@"mp4"];
    [WatermarkEngine addWaterMarkTypeWithGPUImageAndInputVideoURL:self.inputFileUrl AndWaterMarkVideoURL:[NSURL fileURLWithPath:inputFilePath] WithCompletionHandler:^(NSURL *outPutURL, int code) {
        [self playVideoWith:outPutURL];
        [hud hideAnimated:true];
    }];
}

- (IBAction)addWaterForGpuImageType2:(id)sender {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:true];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.label.text = @"loding";
    [WatermarkEngine addWaterMarkTypeWithGPUImageUIElementAndInputVideoURL:self.inputFileUrl WithCompletionHandler:^(NSURL *outPutURL, int code) {
        [self playVideoWith:outPutURL];
        [hud hideAnimated:true];
    }];
}

@end
