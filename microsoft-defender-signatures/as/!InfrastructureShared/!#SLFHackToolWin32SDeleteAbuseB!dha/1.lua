-- Threat: !InfrastructureShared
-- Name: !#SLF:HackTool:Win32/SDeleteAbuse.B!dha
-- Type: 11
-- MpAttributes: !RPF:TopLevelFile & BM_MZ_FILE & OFN:sdelete.exe

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 ~= nil then
  if string.find(l_0_0, "->(vfs:", 1, true) then
    return mp.INFECTED
  elseif string.find(l_0_0, "->[msilres:", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
