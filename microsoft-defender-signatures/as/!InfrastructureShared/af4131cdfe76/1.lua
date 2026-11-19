-- Threat: !InfrastructureShared
-- Name: af4131cdfe76
-- Type: 21

local l_0_0 = nri.GetRawRequestBlob()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = string.lower(l_0_0)
local l_0_2, l_0_3 = string.find(l_0_1, "http://schemas.microsoft.com/velocity/msgs/broadcast", 1, true)
if l_0_3 == nil then
  return mp.CLEAN
end
local l_0_4 = string.sub(l_0_1, l_0_3 + 1, l_0_3 + 8192)
local l_0_5, l_0_6 = string.find(l_0_4, "system.delegateserializationholder", 1, true)
if l_0_5 == nil then
  return mp.CLEAN
end
l_0_6 = l_0_3 + l_0_6
local l_0_7 = string.sub(l_0_1, l_0_6 + 1, l_0_6 + 16384)
local l_0_8, l_0_9 = string.find(l_0_7, "system.diagnostics.process", 1, true)
if l_0_8 == nil then
  return mp.CLEAN
end
l_0_9 = l_0_6 + l_0_9
local l_0_10 = string.sub(l_0_1, l_0_9 + 1, l_0_9 + 16384)
if not string.find(l_0_10, "memberinfoserializationholder", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
