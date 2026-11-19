-- Threat: !InfrastructureShared
-- Name: 2fb3ed266d7a
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 == nil or #l_0_0 < 1 then
  return mp.CLEAN
end
if string.find(string.lower(l_0_0), "\\mpsigstub.exe", 1, true) or string.find(string.lower(l_0_0), "\\mpcmdrun.exe", 1, true) or string.find(string.lower(l_0_0), "\\dsmsvc.exe", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
