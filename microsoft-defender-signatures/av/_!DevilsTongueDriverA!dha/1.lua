-- Threat: \xd8!DevilsTongueDriver.A!dha
-- Type: 24
-- MpAttributes: RPF:TopLevelFile & Detection:#Lowfi:Trojan:Win32/PhysMemView.A

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0:find("\\system32\\physmem.sys", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
