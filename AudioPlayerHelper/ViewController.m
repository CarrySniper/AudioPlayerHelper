//
//  ViewController.m
//  AudioPlayerHelper
//
//  Created by 番茄说 on 16/1/6.
//  Copyright © 2016年 CK_chan. All rights reserved.
//

#import "ViewController.h"
#import "CKAudioPlayerHelper.h"


@interface ViewController ()<CKAudioPlayerHelperDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CGFloat fDeviceWidth = self.view.frame.size.width;
    
    UIButton *playBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    playBtn.frame = CGRectMake(fDeviceWidth/2-130, 79, 120, 40);
    playBtn.layer.cornerRadius = 5;
    playBtn.layer.masksToBounds = YES;
    playBtn.backgroundColor = [UIColor greenColor];
    [playBtn setTitle:@"播放1" forState:UIControlStateNormal];
    [playBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [playBtn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [playBtn setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
    [playBtn.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [playBtn addTarget:self action:@selector(playRecord) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:playBtn];
    
    UIButton *deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    deleteBtn.frame = CGRectMake(fDeviceWidth/2+10, 79, 120, 40);
    deleteBtn.layer.cornerRadius = 5;
    deleteBtn.layer.masksToBounds = YES;
    deleteBtn.backgroundColor = [UIColor redColor];;
    [deleteBtn setTitle:@"播放2" forState:UIControlStateNormal];
    [deleteBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [deleteBtn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [deleteBtn.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [deleteBtn addTarget:self action:@selector(deleteFile) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:deleteBtn];
}

- (void)playRecord{
//    NSString *urlString = @"http://fqs.seejoys.net.cn/Uploads/Record/20160106/6358769990490078082247080.mp3";
    NSString *urlString = @"http://fqs.seejoys.net.cn/Uploads/Audio.mp3";    
//    NSString *urlString = @"http://api.ifunchat.com/Uploads/Record/20160107/6358776024515611572484455.mp3";
    [[CKAudioPlayerHelper shareInstance] managerAudioWithUrlPath:urlString playOrPause:YES];
    [CKAudioPlayerHelper shareInstance].delegate = self;
}
- (void)deleteFile{
//    [[CKAudioPlayerHelper shareInstance] deleteFile];
    
    NSString *urlString = @"http://api.ifunchat.com/Uploads/Record/20160107/6358775955988627148736277.mp3";
    [[CKAudioPlayerHelper shareInstance] managerAudioWithUrlPath:urlString playOrPause:YES];
    [CKAudioPlayerHelper shareInstance].delegate = self;
}

//开始播放
- (void)didAudioPlayerBeginPlay:(AVAudioPlayer*)audioPlayer{
    NSLog(@"开始播放");
}
//停止播放
- (void)didAudioPlayerStopPlay:(AVAudioPlayer*)audioPlayer{
    NSLog(@"停止播放");
}
//暂停播放
- (void)didAudioPlayerPausePlay:(AVAudioPlayer*)audioPlayer{
    NSLog(@"暂停播放");
}
//结束播放
- (void)didAudioPlayerFinishPlay:(AVAudioPlayer*)audioPlayer{
    NSLog(@"结束播放");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
