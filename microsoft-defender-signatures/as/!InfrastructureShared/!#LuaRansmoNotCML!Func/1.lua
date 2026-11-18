-- Threat: !InfrastructureShared
-- Name: !#Lua:RansmoNotCML!Func
-- Type: 13
-- MpAttributes: (BM_TEXT_FILE | BM_ScriptFile) & (Lua:TXTExt | Lua:HTMExt | Lua:HTMLExt | Lua:HTAExt) & Lua:HasRansomNoteString

mp.set_mpattribute("Lua:RansomnoteCML.Throttle")
return mp.CLEAN
