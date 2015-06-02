SuperStrict

Framework bah.maxunit

Import muttley.inifilehandler

Include "Source/TIniGetTests.bmx"
Include "Source/TIniSetTests.bmx"
Include "Source/TIniAddTests.bmx"
Include "Source/TIniCreateMissingTests.bmx"
Include "Source/TIniNoCreateMissingTests.bmx"

Const INI_READ_FILE:String  = "Data/read.ini"
Const INI_WRITE_FILE:String = "Data/write.ini"

exit_ (New TTestSuite.run())
