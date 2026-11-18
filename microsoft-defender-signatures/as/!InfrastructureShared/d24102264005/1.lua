-- Threat: !InfrastructureShared
-- Name: d24102264005
-- Type: 21
-- Includes: BMLuaLib

local l_0_0, l_0_1
local l_0_2 = nri.GetRawRequestBlob()
if l_0_2 == nil then
  return mp.CLEAN
end
l_0_0 = string.match(l_0_2, "%rsp%:Arguments%>%s*([A-Za-z0-9/%+=]+)")
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_1 = MpCommon.Base64Decode(l_0_0)
if l_0_1 ~= nil and string.find(l_0_1, "TargetTypeForDeserialization", 1, true) and string.find(l_0_1, "system:Convert.FromBase64String", 1, true) and string.find(l_0_1, "TVqQAAMAAAAE", 1, true) then
  reportHeaders({"Host", "User-Agent"})
  return mp.INFECTED
end
return mp.CLEAN
