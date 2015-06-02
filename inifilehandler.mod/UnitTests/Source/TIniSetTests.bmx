Type TIniSetTests Extends TTest

	Field iniFile_:TINIFile
	Field section_:String = "Section-03"

	Method SetUp() {before}
		CopyFile(INI_READ_FILE, INI_WRITE_FILE)
		iniFile_ = TINIFile.Create(INI_WRITE_FILE)
		iniFile_.Load()
	EndMethod

	Method TearDown() {after}
		DeleteFile(INI_WRITE_FILE)
	EndMethod

	Method SaveAndReload()
		iniFile_.Save()
		iniFile_ = Null
		iniFile_ = TINIFile.Create(INI_WRITE_FILE)
		iniFile_.Load()
	EndMethod

	Method TestIniReadFileExists() {test}
		assertTrue(FileType(INI_READ_FILE) = 1, "Test file ~q" + INI_READ_FILE + "~q does not exist")
	EndMethod

	Method TestIniFileExists() {test}
		assertTrue(FileType(INI_WRITE_FILE) = 1, "Test file ~q" + INI_WRITE_FILE + "~q does not exist")
	EndMethod

	Method TestSetBadBoolValue() {test}
		Local parameter:String = section_ + "-Bool"
		Local value:String = "test_bad_value"
		Local expected:Int = False

		local exceptionRaised:int = false

		Try
			iniFile_.SetBoolValue(section_, parameter, value)
		Catch exception:Object
			exceptionRaised = True
		End Try

		assertTrue(exceptionRaised)

		SaveAndReload()
		Local actual:Int = iniFile_.GetBoolValue(section_, parameter)
		assertEqualsI(expected, actual)
	EndMethod

	Method TestSetBadBoolValues() {test}
		Local parameter:String = section_ + "-Bools"
		Local values:String[] = ["true", "test_bad_value", "true"]
		Local expected:Int[] = [True]

		local exceptionRaised:int = false

		Try
			iniFile_.SetBoolValues(section_, parameter, values)
		Catch exception:Object
			exceptionRaised = True
		End Try

		assertTrue(exceptionRaised)

		SaveAndReload()
		Local actual:Int[] = iniFile_.GetBoolValues(section_, parameter)
		assertTrue(expected.length = actual.length, actual.length + " Bool values returned, should be " + expected.length)
		If expected.length = actual.length
			For Local i:Int = 0 To expected.length - 1
				assertEqualsI(expected[i], actual[i])
			Next
		End If
	EndMethod

	Method TestSetBoolValue() {test}
		Local parameter:String = section_ + "-Bool"
		Local value:String = "true"
		Local expected:Int = True
		assertTrue(iniFile_.SetBoolValue(section_, parameter, value))
		SaveAndReload()
		Local actual:Int = iniFile_.GetBoolValue(section_, parameter)
		assertEqualsI(expected, actual)
	EndMethod

	Method TestSetBoolValues() {test}
		Local parameter:String = section_ + "-Bools"
		Local values:String[] = ["true", "false", "true"]
		Local expected:Int[] = [True, False, True]
		assertTrue(iniFile_.SetBoolValues(section_, parameter, values))
		SaveAndReload()
		Local actual:Int[] = iniFile_.GetBoolValues(section_, parameter)
		assertTrue(expected.length = actual.length, actual.length + " Bool values returned, should be " + expected.length)
		If expected.length = actual.length
			For Local i:Int = 0 To expected.length - 1
				assertEqualsI(expected[i], actual[i])
			Next
		End If
	EndMethod

	Method TestSetByteValue() {test}
		Local parameter:String = section_ + "-Byte"
		Local expected:Byte = 128
		assertTrue(iniFile_.SetByteValue(section_, parameter, expected))
		SaveAndReload()
		Local actual:Byte = iniFile_.GetByteValue(section_, parameter)
		assertEqualsB(expected, actual)
	EndMethod

	Method TestSetByteValues() {test}
		Local parameter:String = section_ + "-Bytes"
		Local expected:Byte[] = [1:Byte, 2:Byte, 4:Byte, 8:Byte, 16:Byte, 32:Byte, 64:Byte, 128:Byte]
		assertTrue(iniFile_.SetByteValues(section_, parameter, expected))
		SaveAndReload()
		Local actual:Byte[] = iniFile_.GetByteValues(section_, parameter)
		assertTrue(expected.length = actual.length, actual.length + " Byte values returned, should be " + expected.length)
		If expected.length = actual.length
			For Local i:Int = 0 To expected.length - 1
				assertEqualsB(expected[i], actual[i])
			Next
		End If
	EndMethod

	Method TestSetDoubleValue() {test}
		Local parameter:String = section_ + "-Double"
		Local expected:Double = 0.083536680037025857
		assertTrue(iniFile_.SetDoubleValue(section_, parameter, expected))
		SaveAndReload()
		Local actual:Double = iniFile_.GetDoubleValue(section_, parameter)
		assertEqualsD(expected, actual)
	EndMethod

	Method TestSetDoubleValues() {test}
		Local parameter:String = section_ + "-Doubles"
		Local expected:Double[] = [0.35564665809109541:Double, 0.18342404113815192:Double,  ..
									0.62216286677044341:Double, 0.86554079144896112:Double,  ..
									0.67892183539408291:Double]
		assertTrue(iniFile_.SetDoubleValues(section_, parameter, expected))
		SaveAndReload()
		Local actual:Double[] = iniFile_.GetDoubleValues(section_, parameter)
		assertTrue(expected.length = actual.length, actual.length + " Double values returned, should be " + expected.length)
		If expected.length = actual.length
			For Local i:Int = 0 To expected.length - 1
				assertEqualsD(expected[i], actual[i])
			Next
		End If
	EndMethod

	Method TestSetFloatValue() {test}
		Local parameter:String = section_ + "-Float"
		Local expected:Float = 0.243076921
		assertTrue(iniFile_.SetFloatValue(section_, parameter, expected))
		SaveAndReload()
		Local actual:Float = iniFile_.GetFloatValue(section_, parameter)
		assertEqualsF(expected, actual)
	EndMethod

	Method TestSetFloatValues() {test}
		Local parameter:String = section_ + "-Floats"
		Local expected:Float[] = [0.568575323:Float, 0.702018797:Float,  ..
									0.149407387:Float, 0.0464431643:Float,  ..
									0.858661652:Float]
		assertTrue(iniFile_.SetFloatValues(section_, parameter, expected))
		SaveAndReload()
		Local actual:Float[] = iniFile_.GetFloatValues(section_, parameter)
		assertTrue(expected.length = actual.length, actual.length + " Float values returned, should be " + expected.length)
		If expected.length = actual.length
			For Local i:Int = 0 To expected.length - 1
				assertEqualsF(expected[i], actual[i])
			Next
		End If
	EndMethod

	Method TestSetIntValue() {test}
		Local parameter:String = section_ + "-Int"
		Local expected:Int = 0
		assertTrue(iniFile_.SetIntValue(section_, parameter, expected))
		SaveAndReload()
		Local actual:Int = iniFile_.GetIntValue(section_, parameter)
		assertEqualsI(expected, actual)
	EndMethod

	Method TestSetIntValues() {test}
		Local parameter:String = section_ + "-Ints"
		Local expected:Int[] = [- 763445:Int, 63456373:Int,  ..
									43:Int, - 87645674:Int,  ..
									00:Int]
		assertTrue(iniFile_.SetIntValues(section_, parameter, expected))
		SaveAndReload()
		Local actual:Int[] = iniFile_.GetIntValues(section_, parameter)
		assertTrue(expected.length = actual.length, actual.length + " Int values returned, should be " + expected.length)
		If expected.length = actual.length
			For Local i:Int = 0 To expected.length - 1
				assertEqualsI(expected[i], actual[i])
			Next
		End If
	EndMethod

	Method TestSetLongValue() {test}
		Local parameter:String = section_ + "-Long"
		Local expected:Long = 845532373
		assertTrue(iniFile_.SetLongValue(section_, parameter, expected))
		SaveAndReload()
		Local actual:Long = iniFile_.GetLongValue(section_, parameter)
		assertEqualsL(expected, actual)
	EndMethod

	Method TestSetLongValues() {test}
		Local parameter:String = section_ + "-Longs"
		Local expected:Long[] = [- 306420195:Long, - 774074113:Long, 1070908949:Long,  ..
									973317178:Long, - 830430317:Long]
		assertTrue(iniFile_.SetLongValues(section_, parameter, expected))
		SaveAndReload()
		Local actual:Long[] = iniFile_.GetLongValues(section_, parameter)
		assertTrue(expected.length = actual.length, actual.length + " Long values returned, should be " + expected.length)
		If expected.length = actual.length
			For Local i:Int = 0 To expected.length - 1
				assertEqualsL(expected[i], actual[i])
			Next
		End If
	EndMethod

	Method TestSetShortValue() {test}
		Local parameter:String = section_ + "-Short"
		Local expected:Short = 31156
		assertTrue(iniFile_.SetShortValue(section_, parameter, expected))
		SaveAndReload()
		Local actual:Short = iniFile_.GetShortValue(section_, parameter)
		assertEqualsS(expected, actual)
	EndMethod

	Method TestSetShortValues() {test}
		Local parameter:String = section_ + "-Shorts"
		Local expected:Short[] = [38842:Short, 50128:Short,  ..
									35116:Short, 46628:Short,  ..
									59081:Short]
		assertTrue(iniFile_.SetShortValues(section_, parameter, expected))
		SaveAndReload()
		Local actual:Short[] = iniFile_.GetShortValues(section_, parameter)
		assertTrue(expected.length = actual.length, actual.length + " Short values returned, should be " + expected.length)
		If expected.length = actual.length
			For Local i:Int = 0 To expected.length - 1
				assertEqualsS(expected[i], actual[i])
			Next
		End If
	EndMethod

	Method TestSetStringValue() {test}
		Local parameter:String = section_ + "-String"
		Local expected:String = "This is my test string.  Will it work?"
		assertTrue(iniFile_.SetStringValue(section_, parameter, expected))
		SaveAndReload()
		Local actual:String = iniFile_.GetStringValue(section_, parameter)
		assertEquals(expected, actual)
	EndMethod

	Method TestSetStringValues() {test}
		Local parameter:String = section_ + "-Strings"
		Local expected:String[] = ["This"."is", "my", "test", "string.", "Will", "it", "work?"]
		assertTrue(iniFile_.SetStringValues(section_, parameter, expected))
		SaveAndReload()
		Local actual:String[] = iniFile_.GetStringValues(section_, parameter)
		assertTrue(expected.length = actual.length, actual.length + " String values returned, should be " + expected.length)
		If expected.length = actual.length
			For Local i:Int = 0 To expected.length - 1
				assertEquals(expected[i], actual[i])
			Next
		End If
	EndMethod
End Type
