Rem
'
' Copyright (c) 2007-2013 Paul Maskelyne <muttley@muttleyville.org>.

' All rights reserved. Use of this code is allowed under the
' Artistic License 2.0 terms, as specified in the LICENSE file
' distributed with this code, or available from
' http://www.opensource.org/licenses/artistic-license-2.0.php
'
EndRem

Type TINIValue
	Field value_:String

	Method GetValue:String()
		Return value_
	End Method

	Method SetValue(value:String)
		value_ = value
	End Method

EndType
