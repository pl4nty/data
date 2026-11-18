-- Threat: !InfrastructureShared
-- Name: !#ALF:SuspiciousZip.B
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & BM_ZIP_FILE

local l_0_0 = mp.getfilesize()
if l_0_0 < 30 then
  return mp.CLEAN
end
local l_0_1 = mp.readheader(8, 2)
if l_0_1 ~= "\000\000" then
  return mp.CLEAN
end
local l_0_2 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if string.find(l_0_2, ".cpack", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
