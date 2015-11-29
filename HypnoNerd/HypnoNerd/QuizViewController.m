//
//  QuizViewController.m
//  Quiz
//
//  Created by 胡振生 on 15/11/23.
//  Copyright © 2015年 胡振生. All rights reserved.
//

#import "QuizViewController.h"

@interface QuizViewController ()

@property (nonatomic) int currentQuestionIndex;
@property (nonatomic, copy) NSArray *questions;
@property (nonatomic, copy) NSArray *answers;

@property (nonatomic, weak) IBOutlet UILabel *questionLabel;
@property (nonatomic, weak) IBOutlet UILabel *answerLabel;

@end

@implementation QuizViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.tabBarItem.title = @"Hypnosis";
        UIImage *img = [UIImage imageNamed:@"Hypno"];
        self.tabBarItem.image = img;
        self.questions = @[@"Where Are You From ?",
                           @"What's 7 + 7 ?",
                           @"What is capital of China ?"];
        self.answers = @[@"HeNan",
                         @"14",
                         @"BeiJing"];
    }
    return self;
}

- (IBAction)showQuestion:(id)sender
{
    // Next question
    self.currentQuestionIndex++;
    // the last question
    if (self.currentQuestionIndex == [self.questions count]) {
        self.currentQuestionIndex = 0;
    }
    NSString *question = self.questions[self.currentQuestionIndex];
    self.questionLabel.text = question;
    self.answerLabel.text = @"???";
}
- (IBAction)showAnswer:(id)sender
{
    NSString *answer = self.answers[self.currentQuestionIndex];
    self.answerLabel.text = answer;
} 
@end
