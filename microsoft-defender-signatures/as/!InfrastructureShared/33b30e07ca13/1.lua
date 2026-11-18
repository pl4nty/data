-- Threat: !InfrastructureShared
-- Name: 33b30e07ca13
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 then
  if string.find(string.lower(l_0_0), "\\program files", 1, true) or string.find(string.lower(l_0_0), "\\windows\\", 1, true) or string.find(string.lower(l_0_0), "\\mpsigstub.exe", 1, true) or string.find(string.lower(l_0_0), "\\mpcmdrun.exe", 1, true) then
    return mp.CLEAN
  end
  return mp.INFECTED
end
return mp.CLEAN
