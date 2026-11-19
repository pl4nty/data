-- Threat: !InfrastructureShared
-- Name: 1540fd472d55
-- Type: 21

if nri.IsResponse() then
  return mp.CLEAN
end
local l_0_0 = nri.GetHttpRequestHeader("X-Implant-Token")
if l_0_0 == nil or not l_0_0:match("%S") then
  return mp.CLEAN
end
return mp.INFECTED
