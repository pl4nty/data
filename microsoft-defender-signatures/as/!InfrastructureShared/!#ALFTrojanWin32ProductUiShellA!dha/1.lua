-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Win32/ProductUiShell.A!dha
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & Lua:PHPExt

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0:find("\\control manager\\webui\\productui", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
