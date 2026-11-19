-- Threat: !InfrastructureShared
-- Name: 69b34cd62698
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 == nil or string.len(l_0_0) < 1 then
  return mp.CLEAN
end
if string.find(string.lower(l_0_0), "\\program files", 1, true) or string.find(string.lower(l_0_0), "\\mpsigstub.exe", 1, true) or string.find(string.lower(l_0_0), "\\mpcmdrun.exe", 1, true) then
  return mp.CLEAN
end
if bm.GetSignatureMatchDuration() < 40000000 then
  return mp.INFECTED
end
return mp.CLEAN
