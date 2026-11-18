-- Threat: !InfrastructureShared
-- Name: e1416d42ebab
-- Type: 21

local l_0_0 = nri.GetRawRequestBlob()
local l_0_1 = nri.GetRawResponseBlob()
if l_0_0 == nil or l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = string.lower(l_0_0)
local l_0_3 = string.lower(l_0_1)
if string.find(l_0_2, "authorization:", 1, true) ~= nil then
  return mp.CLEAN
end
if string.find(l_0_3, "http/1.1 200", 1, true) == nil or string.find(l_0_3, "\\\"status\\\":200", 1, true) == nil then
  return mp.CLEAN
end
local l_0_4 = string.match(l_0_3, "\\\"brokerversion\\\"%s*:%s*\\\"([0-9]+%.[0-9]+%.[0-9]+)")
if l_0_4 == nil then
  return mp.CLEAN
end
local l_0_5, l_0_6, l_0_7 = string.match(l_0_4, "^(%d+)%.(%d+)%.(%d+)$")
l_0_5 = tonumber(l_0_5)
l_0_6 = tonumber(l_0_6)
l_0_7 = tonumber(l_0_7)
if l_0_5 == nil or l_0_6 == nil or l_0_7 == nil then
  return mp.CLEAN
end
if l_0_5 == 6 and (l_0_6 == 0 or l_0_6 == 1 and l_0_7 < 2) then
  return mp.INFECTED
end
return mp.CLEAN
