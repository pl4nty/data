-- Threat: !InfrastructureShared
-- Name: 254033c72107
-- Type: 21

if nri.IsResponse() then
  return mp.CLEAN
end
local l_0_0 = nri.GetHttpRequestHeader("X-Implant-Token")
if l_0_0 == nil or not l_0_0:match("%S") then
  return mp.CLEAN
end
local l_0_1 = nri.GetURI()
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2, l_0_3 = l_0_1:match("^([%a]+)://([^/?#]+)")
if l_0_2 == nil or l_0_3 == nil then
  return mp.CLEAN
end
l_0_2 = string.lower(l_0_2)
if l_0_2 ~= "http" and l_0_2 ~= "https" then
  return mp.CLEAN
end
if string.find(l_0_3, "@", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
