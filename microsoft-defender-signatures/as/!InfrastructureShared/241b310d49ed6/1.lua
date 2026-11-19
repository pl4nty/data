-- Threat: !InfrastructureShared
-- Name: 241b310d49ed6
-- Type: 21

local l_0_0 = bm.get_imagepath()
if not l_0_0 then
  return mp.CLEAN
end
if string.find(string.lower(l_0_0), "windows\\system32\\svchost.exe", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
