-- Threat: !InfrastructureShared
-- Name: 13ad742f32d15
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if not l_0_1 then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
local l_0_2 = {"hidden"}
if not contains(l_0_1, l_0_2) then
  return mp.CLEAN
end
local l_0_3 = {
  "iwr",
  "invoke-webrequest",
  "net.webclient"
}
if not contains(l_0_1, l_0_3) then
  return mp.CLEAN
end
local l_0_4 = {"powershell"}
if not contains(l_0_1, l_0_4) then
  return mp.CLEAN
end
return mp.INFECTED
