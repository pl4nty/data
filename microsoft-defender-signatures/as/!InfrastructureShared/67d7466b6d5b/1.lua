-- Threat: !InfrastructureShared
-- Name: 67d7466b6d5b
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
l_0_1 = string.gsub(string.lower(l_0_1), "[%'\"]%)?%+%(?[%'\"]", "")
local l_0_2 = {
  "iex",
  "invoke-expression"
}
if not contains(l_0_1, l_0_2) then
  return mp.CLEAN
end
local l_0_3 = {
  "invoke-webrequest",
  "iwr"
}
if not contains(l_0_1, l_0_3) then
  return mp.CLEAN
end
local l_0_4 = {
  "service connection",
  "axiom sniper",
  "forse restart"
}
if not contains(l_0_1, l_0_4) then
  return mp.CLEAN
end
return mp.INFECTED
