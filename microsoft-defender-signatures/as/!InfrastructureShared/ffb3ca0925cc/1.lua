-- Threat: !InfrastructureShared
-- Name: ffb3ca0925cc
-- Type: 21

local l_0_0 = bm.get_imagepath()
if not l_0_0 then
  return mp.CLEAN
end
if string.find(string.lower(l_0_0), "windows\\system32\\poqexec.exe", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
