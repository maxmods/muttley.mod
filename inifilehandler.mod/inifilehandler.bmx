SuperStrict

Rem
    bbdoc:muttley\inifilehandler
End Rem
Module muttley.inifilehandler

ModuleInfo "Name: muttley.inifilehandler"
ModuleInfo "Version: 1.1.1"
ModuleInfo "License: Artistic License 2.0"
ModuleInfo "Author: Paul Maskelyne (Muttley)"
ModuleInfo "Copyright: (C) 2007-2013 Paul Maskelyne"
ModuleInfo "E-Mail: muttley@muttleyville.org"
ModuleInfo "Website: http://www.muttleyville.org"

ModuleInfo "History: 1.1.1"
ModuleInfo "History: Migration to bitbucket"
ModuleInfo "History: 1.1.0"
ModuleInfo "History: Code overhauled to correct issues with incorrectly returning default values.  Also added Unit Tests using bah.maxunit"
ModuleInfo "History: 1.0.7"
ModuleInfo "History: Fixed problem with docmods not generating documentation correctly"
ModuleInfo "History: 1.0.6"
ModuleInfo "History: Re-released under the Artistic License 2.0"
ModuleInfo "History: 1.0.5"
ModuleInfo "History: Missing sections and parameters are now created correcty when trying to set them and CreateMissingEntries() is set to True"
ModuleInfo "History: 1.0.4"
ModuleInfo "History: Added support for string based Booleans as BlitzMax doesn't have a proper bool datatype"
ModuleInfo "History: 1.0.3"
ModuleInfo "History: Missing parameters that are requested can now be automatically added to ini file by using CreateMissingEntries()"
ModuleInfo "History: 1.0.2"
ModuleInfo "History: Get* methods can now take default values which are returned if the requested parameter doesn't exist"
ModuleInfo "History: 1.0.1"
ModuleInfo "History: No longer writing Global and Section comments to INI file when comment is blank"
ModuleInfo "History: 1.0.0"
ModuleInfo "History: Initial Release"

Import brl.filesystem
Import brl.system
Import brl.standardio
Import brl.retro
Import brl.linkedlist
Import brl.data

Include "Source\TINIFile.bmx"
Include "Source\TINIParameter.bmx"
Include "Source\TINISection.bmx"
Include "Source\TINIValue.bmx"
