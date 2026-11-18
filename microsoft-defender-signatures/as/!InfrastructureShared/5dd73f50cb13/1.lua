-- Threat: !InfrastructureShared
-- Name: 5dd73f50cb13
-- Type: 21
-- Includes: AppomalyHelpers, BMLuaLib

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if l_0_1 == "" or l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = string.lower(l_0_1)
local l_0_3 = {
  "shorter.me",
  "yip.su",
  "iplogger.co"
}
if not contains(l_0_2, l_0_3) then
  return mp.CLEAN
end
if hasBase64Content(l_0_2) then
  return mp.INFECTED
end
return mp.CLEAN
