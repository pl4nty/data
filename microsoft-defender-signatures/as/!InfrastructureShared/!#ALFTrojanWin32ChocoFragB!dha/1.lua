-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Win32/ChocoFrag.B!dha
-- Type: 24
-- MpAttributes: RPF:TopLevelFile & (Lua:DATExt | Lua:XMLExt) & Lua:FileInsideSystemFolder

local l_0_0 = mp.getfilesize()
if 8000000 < l_0_0 then
  return mp.CLEAN
end
if l_0_0 < 204800 then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1:find("\\windows\\system32\\sys.dat", 1, true) or l_0_1:find("\\windows\\system32\\richlog.dat", 1, true) or l_0_1:find("\\windows\\system32\\flash.dat", 1, true) or l_0_1:find("\\windows\\system32\\main.dat", 1, true) or l_0_1:find("\\windows\\system32\\actionlist.xml", 1, true) or l_0_1:find("\\windows\\system32\\wbem\\microsoft.net.props", 1, true) then
  mp.set_mpattribute("MpNonPIIFileType")
  return mp.INFECTED
end
return mp.CLEAN
