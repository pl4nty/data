-- Threat: !InfrastructureShared
-- Name: !#LUA:UnknownExeExtInRTF
-- Type: 13
-- MpAttributes: BM_UNKNOWN_FILE

local l_0_0 = mp.getfilesize()
if l_0_0 < 400000 or 1000000 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = string.lower(mp.getfilename())
if string.find(l_0_1, "%-%>%(rtf[0-9]+%)%-%>[a-z]+.exe$") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
