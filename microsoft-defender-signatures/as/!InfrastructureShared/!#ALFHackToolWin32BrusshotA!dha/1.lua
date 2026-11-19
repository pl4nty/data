-- Threat: !InfrastructureShared
-- Name: !#ALF:HackTool:Win32/Brusshot.A!dha
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & (Lua:EXEExt | Lua:CHMExt | Lua:VBSExt | Lua:LNKExt | Lua:PS1Ext)

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0:find("\\htmlsmuggling\\lnkbuilder", 1, true) or l_0_0:find("\\htmlsmuggling\\htmlsmuggling", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
