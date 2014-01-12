#DTFileController#

The simple to control file copy, move, get path operate on iOS.

---

## Features

* **Singleton instance** - Use `[DTFileController mainController]` get the instance, and available on multiple thread.
* **Simple Get System Path** - Get the system defualt path (such as /Document/, /Library/ under current App directory), and can append file or directory name after the path.
* **Trace Copy or Move File Progress** - It can get copy and move operation progress, and using other thread to operate without block the main thread.
* **Get File Attribute Simply** - Without get the attributes as **NSDictonary** object, for example just using <code>[[DTFileController mainController] getFileCreationDateAtPath:**YourPath**]</code> to get file creation date as **NSDate** object.

## License

Licensed under the Apache License, Version 2.0 (the "License");  
you may not use this file except in compliance with the License.  
You may obtain a copy of the License at

>[http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0)
 
Unless required by applicable law or agreed to in writing,  
software distributed under the License is distributed on an  
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,  
either express or implied.   
See the License for the specific language governing permissions  
and limitations under the License.