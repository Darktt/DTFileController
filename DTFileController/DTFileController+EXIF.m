//  DTFileController+EXIF.m
//
// Copyright © 2014 Darktt
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

#import "DTFileController+EXIF.h"

#import <ImageIO/CGImageSource.h>
#import <ImageIO/CGImageProperties.h>

// This catagory using AssetsLibrary framework, if not used, please comment it.
#define UES_IMAGEIO_FRAMEWORK

@implementation DTFileController (EXIF)

- (NSDictionary *)imagePropertiesWithPath:(NSString *)path
{
    NSURL *imageFileURL = [NSURL fileURLWithPath:path];
    CGImageSourceRef imageSource = CGImageSourceCreateWithURL((CFURLRef)imageFileURL, NULL);
    
    NSDictionary *options = @{(id)kCGImageSourceShouldCache: @(NO)};
    
    CFDictionaryRef imageProperties = CGImageSourceCopyPropertiesAtIndex(imageSource, 0, (CFDictionaryRef)options);
    CFRelease(imageSource);
    
    NSDictionary *_imageProperties = (NSDictionary *)imageProperties;
    CFRelease(imageProperties);
    
    return _imageProperties;
}

- (NSDictionary *)EXIFInformationWithPath:(NSString *)path
{
    NSDictionary *imageProperties = [self imagePropertiesWithPath:path];
    
    NSDictionary *EXIF = imageProperties[(id)kCGImagePropertyExifDictionary];
    
    return EXIF;
}

@end
