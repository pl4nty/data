-- Threat: !InfrastructureShared
-- Name: 3bd7762c9d98
-- Type: 21
-- Includes: LuaFuncHelper, BMLuaLib

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
l_0_1 = l_0_1:lower()
l_0_1 = l_0_1:gsub("%^", "")
l_0_1 = l_0_1:gsub("'", "")
l_0_1 = l_0_1:gsub(",", "")
l_0_1 = l_0_1:gsub("%s+", " ")
local l_0_2 = GetRollingQueueKeys("IsClickFixCMD")
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = {
  " iex",
  "invoke-expression",
  "iwr",
  "invoke-webrequest",
  "irm ",
  "invoke-restmethod",
  "|iex"
}
if not contains(l_0_1, l_0_3) then
  return mp.CLEAN
end
return mp.INFECTED
