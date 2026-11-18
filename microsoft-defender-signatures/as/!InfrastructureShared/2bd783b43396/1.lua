-- Threat: !InfrastructureShared
-- Name: 2bd783b43396
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
local l_0_2 = string.lower(l_0_1)
local l_0_3 = {
  "guard:",
  "cdn trace id:",
  "gatecheck:",
  "origin portal :",
  "place your entry here:",
  "your work goes here :",
  "userauth:",
  " rem ",
  "permission granted"
}
if contains(l_0_2, l_0_3) then
  return mp.INFECTED
end
return mp.CLEAN
