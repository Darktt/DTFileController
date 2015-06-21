//  DTFileController+EXIF.h
//
// Copyright (c) 2014 Darktt
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

#import "DTFileController.h"

@interface DTFileController (EXIF)

/**
 *  Get all of image property information from given path, such as EXIF information etc.
 *
 *  @param path The path of file. this path must be image file path.
 *
 *  @return The image property as NSDictionary object.
 *
 */
- (NSDictionary *)imagePropertiesWithPath:(NSString *)path;

/**
 *  Get EXIF information from given path.
 *
 *  @param path The path of file. this path must be image file path.
 *
 *  @return nil, If not have EXIF information.
 */
- (NSDictionary *)EXIFInformationWithPath:(NSString *)path;

@end