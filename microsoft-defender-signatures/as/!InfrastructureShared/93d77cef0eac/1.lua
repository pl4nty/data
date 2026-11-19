-- Threat: !InfrastructureShared
-- Name: 93d77cef0eac
-- Type: 21
-- Includes: BMLuaLib

local l_0_0, l_0_1
local l_0_2 = mp.GetScannedPPID()
if not l_0_2 then
  return mp.CLEAN
end
local l_0_3 = mp.GetProcessCommandLine(l_0_2)
if not l_0_3 or #l_0_3 <= 10 then
  return mp.CLEAN
end
l_0_1 = string.match(l_0_3, "echo%s+['\"]?([A-Za-z0-9/%+=]+)['\"]?")
if l_0_1 == nil then
  return mp.CLEAN
end
l_0_0 = MpCommon.Base64Decode(l_0_1)
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = l_0_0:lower()
local l_0_4 = {
  "famiode.com",
  "raxelpak.com",
  "saramoftah.com",
  "wriconsult.com"
}
if contains(l_0_0, l_0_4) then
  return mp.INFECTED
end
return mp.CLEAN
