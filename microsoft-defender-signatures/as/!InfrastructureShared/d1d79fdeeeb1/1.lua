-- Threat: !InfrastructureShared
-- Name: d1d79fdeeeb1
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if l_0_1 == nil or #l_0_1 <= 60 then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
local l_0_2 = {
  "guard:",
  "cdn trace id:",
  "gatecheck:",
  "origin portal :",
  "place your entry here:",
  "your work goes here :",
  "userauth:",
  " rem ",
  "permission granted",
  "checkpoint cleared:",
  "you're approved",
  "gateway unlocked",
  "gates are open"
}
if contains(l_0_1, l_0_2) then
  return mp.INFECTED
end
return mp.CLEAN
