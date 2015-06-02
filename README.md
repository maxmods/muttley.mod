#About

The **muttley.inifilehandler** module allows you easily read/write INI style
configuration files.

#Dependencies

The **muttley.inifilehandler** module doesn't rely on any 3rd party modules.

The Unit Tests rely on Bruce Henderson's [bah.maxunit][6] module available
from his **maxmods** [Google Code project page][1].

In order to successfully build and run the inifilehandler module tests you
will need to install this module.

#Installation

To install this module, copy the **inifilehandler.mod** directory into a folder
called **muttley.mod** in your **BlitzMax\mod** directory.

For example, on Windows:

	xcopy inifilehandler.mod C:\BlitzMax\mod\muttley.mod\. /E /I

On Linux:

	mkdir /opt/BlitzMax/mod/muttley.mod
	cp -r inifilehandler.mod /opt/BlitzMax/mod/muttley.mod/.

Then build the module as follows (assuming bmk is in your path):

	bmk makemods -a muttley.inifilehandler

#Unit Tests

Unit Tests for the module are included in the **inifilehandler.mod\UnitTests**
folder, and these can be run as follows:

	bmk makeapp -a -r -t console -x inifilehandler.mod\UnitTests\Main.bmx

#Examples

The **inifilehandler.mod\Example** directory contains an example application
which show how the inifilehandler module is used.

#Sublime Project

For [Sublime Text 2][2] users there is a project file which can be used if you
wish modify this module in any way.  The project file includes build systems
for building the module, and building and running the Unit Tests.  These build
systems rely on the [Gradle][3] build automation system.

#Acknowledgements

Many thanks to Brucey for his MaxUnit module.

#License

Copyright (c) 2007-2013 Paul Maskelyne ([muttley@muttleyville.org][4]).

All rights reserved. Use of this code is allowed under the
Artistic License 2.0 terms, as specified in the LICENSE file
distributed with this code, or available from
[http://www.opensource.org/licenses/artistic-license-2.0.php][5]

[1]: https://code.google.com/p/maxmods/
[2]: http://www.sublimetext.com/
[3]: http://www.gradle.org/
[4]: mailto:muttley@muttleyville.org
[5]: http://www.opensource.org/licenses/artistic-license-2.0.php
[6]: https://code.google.com/p/maxmods/wiki/MaxUnitModule
