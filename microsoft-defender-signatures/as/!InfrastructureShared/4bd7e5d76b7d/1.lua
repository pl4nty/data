-- Threat: !InfrastructureShared
-- Name: 4bd7e5d76b7d
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetScannedPPID()
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if l_0_1 == nil then
  return mp.CLEAN
end
l_0_1 = l_0_1:lower()
l_0_1 = l_0_1:gsub("%^", "")
l_0_1 = l_0_1:gsub("'", "")
l_0_1 = l_0_1:gsub("%s+", " ")
local l_0_2 = {"http"}
if not contains(l_0_1, l_0_2) then
  return mp.CLEAN
end
local l_0_3 = {
  " iex",
  "invoke-expression",
  "iwr",
  "invoke-webrequest",
  "irm ",
  "invoke-restmethod"
}
if not contains(l_0_1, l_0_3) then
  return mp.CLEAN
end
return mp.INFECTED
