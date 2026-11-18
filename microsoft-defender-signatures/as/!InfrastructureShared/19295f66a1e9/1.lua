-- Threat: !InfrastructureShared
-- Name: 19295f66a1e9
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 4096 or 409600 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename()
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
if string.find(l_0_1, ".pbxproj", -8, true) ~= nil then
  mp.set_mpattribute("MpIsExhaustiveScriptScan")
  return mp.INFECTED
end
return mp.CLEAN
