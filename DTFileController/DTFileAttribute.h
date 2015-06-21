//  DTFileAttribute.h
//
// Copyright (c) 2013 Darktt
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//   http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#import <Foundation/Foundation.h>

#if __has_feature(objc_instancetype)
#define DTInstancetype instancetype
#else
#define DTInstancetype id
#endif

@interface DTFileAttribute : NSObject

@property (nonatomic, readonly) NSString *fileName;
@property (nonatomic, readonly) NSString *filePathExtension;
@property (nonatomic, readonly) NSNumber *fileSize;
@property (nonatomic, readonly) NSDate *fileCreationDate;
@property (nonatomic, readonly) NSDate *fileModificationDate;

+ (DTInstancetype)fileAttributeWithPath:(NSString *)filePath;
+ (DTInstancetype)fileAttributeWithURL:(NSURL *)fileURL;

- (DTInstancetype)initWithPath:(NSString *)filePath;
- (DTInstancetype)initWithURL:(NSURL *)fileURL;

@end
