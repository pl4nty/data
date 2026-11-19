-- Threat: !InfrastructureShared
-- Name: 68412c2fc8e6
-- Type: 21

local l_0_0 = nri.GetRawResponseBlob()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = string.lower(l_0_0)
if string.find(l_0_1, "methodinvokingfactorybean", 1, true) == nil or string.find(l_0_1, "java.lang.runtime", 1, true) == nil or string.find(l_0_1, "exec", 1, true) == nil then
  return mp.CLEAN
end
return mp.INFECTED
