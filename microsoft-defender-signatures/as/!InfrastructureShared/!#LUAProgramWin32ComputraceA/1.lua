-- Threat: !InfrastructureShared
-- Name: !#LUA:Program:Win32/Computrace.A
-- Type: 13
-- MpAttributes: NID:Program:Win32/Computrace.A

local l_0_0 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
if l_0_0 == nil then
  return mp.CLEAN
end
if string.find(l_0_0, "\\system32", 1, true) ~= nil then
  return mp.INFECTED
end
if string.find(l_0_0, "\\syswow64", 1, true) ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
