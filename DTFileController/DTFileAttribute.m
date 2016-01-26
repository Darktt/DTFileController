//  DTFileAttribute.m
//
// Copyright © 2013 Darktt
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

#import "DTFileAttribute.h"
#import "DTFileController.h"

@interface DTFileAttribute ()
{
    NSString *_filePath;
    NSURL *_fileURL;
    
    NSDictionary *_fileAttribute;
}

@end

@implementation DTFileAttribute

+ (instancetype)fileAttributeWithPath:(NSString *)filePath
{
    DTFileAttribute *attribute = [[DTFileAttribute alloc] initWithPath:filePath];
    
    return [attribute autorelease];
}

+ (instancetype)fileAttributeWithURL:(NSURL *)fileURL
{
    DTFileAttribute *attribute = [[DTFileAttribute alloc] initWithURL:fileURL];
    
    return [attribute autorelease];
}

- (instancetype)initWithPath:(NSString *)filePath
{
    self = [super init];
    
    if (self == nil) return nil;
    
    _filePath = [filePath retain];
    
    _fileAttribute = [[DTFileController mainController] getFileInformationAtPath:_filePath];
    
    return self;
}

- (instancetype)initWithURL:(NSURL *)fileURL
{
    self = [super init];
    
    if (self == nil) return nil;
    
    if (![fileURL isFileURL]) {
        [NSException raise:NSInvalidArgumentException format:@"%@-line %d: URL pattern error, not file URL", [self class], __LINE__];
        
        return nil;
    }
    
    _fileURL = [fileURL retain];
    
    _fileAttribute = [[DTFileController mainController] getFileInformationAtPath:[_fileURL path]];
    
    return self;
}

- (void)dealloc
{
    [super dealloc];
    
    if (_filePath != nil) {
        [_filePath release];
        _filePath = nil;
    }
    
    if (_fileURL != nil) {
        [_fileURL release];
        _fileURL = nil;
    }
    
    [_fileAttribute release];
}

#pragma mark - Override Porperty

- (NSString *)fileName
{
    NSString *fileName = nil;
    
    if (_filePath != nil) {
        fileName = [_filePath lastPathComponent];
    }
    
    if (_fileURL != nil) {
        fileName = [_fileURL lastPathComponent];
    }
    
    return fileName;
}

- (NSString *)filePathExtension
{
    NSString *filePathExtension = nil;
    
    if (_filePath != nil) {
        filePathExtension = [_filePath pathExtension];
    }
    
    if (_fileURL != nil) {
        filePathExtension = [_fileURL pathExtension];
    }
    
    return filePathExtension;
}

- (NSNumber *)fileSize
{
    return (NSNumber *)_fileAttribute[NSFileSize];
}

- (NSDate *)fileCreationDate
{
    return [_fileAttribute fileCreationDate];
}

- (NSDate *)fileModificationDate
{
    return [_fileAttribute fileModificationDate];
}

@end
