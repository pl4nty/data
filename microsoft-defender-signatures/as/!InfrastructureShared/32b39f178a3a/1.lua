-- Threat: !InfrastructureShared
-- Name: 32b39f178a3a
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 and string.find(l_0_0, "\\admstaskexeutor\\taskexecutor.exe", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
